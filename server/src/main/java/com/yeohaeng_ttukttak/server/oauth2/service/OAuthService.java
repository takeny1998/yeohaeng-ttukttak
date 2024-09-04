package com.yeohaeng_ttukttak.server.oauth2.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidAuthorizationException;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.OAuthProvidable;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import com.yeohaeng_ttukttak.server.user.domain.Gender;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuth;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRegisterResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@RequiredArgsConstructor
public class OAuthService {

    private final OAuthProvidable oauthProvider;
    private final UserRepository userRepository;
    private final JwtService jwtService;

    @Transactional
    public OAuthRegisterResult register(OAuthRegisterCommand command) {

        GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(command.code(), "register"));

        String openId = getIdResult.id();
        String email = getIdResult.email();
        String name = getIdResult.name();

        User user = userRepository.findByOpenId(openId)
                .orElseGet(() -> {
                    final GetProfileResult getProfileResult = oauthProvider.getProfile();

                    final OAuthProvider provider = oauthProvider.getProvider();
                    final Gender gender = getProfileResult.gender();
                    final LocalDate birthDay = getProfileResult.birthday();

                    OAuth oauth = new OAuth(openId, provider);

                    return userRepository.save(
                            new User(oauth, name, email, gender, birthDay));
                });

        log.debug("user={}", user);

        String userId = user.getId().toString();

        IssueAuthTokensResult tokenResult = jwtService.issueAuthTokens(
                new IssueAuthTokensCommand(userId, command.deviceId(), command.deviceName()));

        return tokenResult.toRegisterResult();
    }

    @Transactional
    public void revoke(OAuthRevokeCommand command) {

        final String authorizationCode = command.authorizationCode();
        final UUID userId = UUID.fromString(command.userId());

        final GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(authorizationCode, "revoke"));

        oauthProvider.revoke(new RevokeCommand(getIdResult.token()));

        User user = userRepository.findById(userId)
                .orElseThrow(EntityNotFoundException::new);

        final boolean isUserMatched = Objects.equals(userId, user.getId());

        if (!isUserMatched) {
            throw new InvalidAuthorizationException();
        }

        // TODO: Soft Delete 를 구현해 회원 탈퇴/정지 기록을 보존한다.
        userRepository.delete(user);

        jwtService.deleteAuthToken(userId.toString(), command.deviceId());

    }

}
