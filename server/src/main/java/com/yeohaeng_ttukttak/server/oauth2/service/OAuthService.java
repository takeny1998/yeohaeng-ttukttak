package com.yeohaeng_ttukttak.server.oauth2.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.bad_request.RequiredFieldMissingException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthSession;
import com.yeohaeng_ttukttak.server.oauth2.repository.OAuthSessionRepository;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuth;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RegisterResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@RequiredArgsConstructor
public class OAuthService {

    private final OAuthProvidable oauthProvider;
    private final UserRepository userRepository;
    private final OAuthSessionRepository sessionRepository;

    private final JwtService jwtService;

    @Transactional
    public RegisterResult register(String code, String state) {

        OAuthSession session = sessionRepository.findById(UUID.fromString(state))
                .orElseThrow(() -> new RequiredFieldMissingException("state"));

        GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(code, "register"));

        String openId = getIdResult.id();
        String name = getIdResult.name();

        User user = userRepository.findByOpenId(openId)
                .orElseGet(() -> {
                    GetProfileResult getProfileResult = oauthProvider.getProfile();
                    OAuth oauth = new OAuth(openId, oauthProvider.getProvider());
                    User newUser = new User(oauth, name, getProfileResult.gender(), getProfileResult.birthday());

                    userRepository.save(newUser);
                    return newUser;
                });

        log.debug("user={}", user);

        String userId = user.getId().toString();

        IssueAuthTokensResult authTokensResult =
                jwtService.issueAuthTokens(new IssueAuthTokensCommand(userId));

        session.setUserId(userId);
        session.setRefreshToken(
                authTokensResult.refreshToken(), authTokensResult.expiresAt());

        log.debug("session={}", session);

        return new RegisterResult(
                authTokensResult.accessToken(),
                authTokensResult.refreshToken());
    }

    @Transactional
    public void revoke(String code) {

        GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(code, "revoke"));

        oauthProvider.revoke(new RevokeCommand(getIdResult.token()));

        User user = userRepository.findByOpenId(getIdResult.id())
                .orElseThrow(() -> new EntityNotFoundException(User.class));

        // TODO: Soft Delete 를 구현해 회원 탈퇴/정지 기록을 보존한다.
        userRepository.delete(user);

    }

}
