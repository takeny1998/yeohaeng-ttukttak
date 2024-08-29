package com.yeohaeng_ttukttak.server.oauth2.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.OAuthProvidable;
import com.yeohaeng_ttukttak.server.user.domain.Gender;
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

import java.time.LocalDate;
import java.util.Objects;

@Slf4j
@RequiredArgsConstructor
public class OAuthService {

    private final OAuthProvidable oauthProvider;
    private final UserRepository userRepository;

    @Transactional
    public RegisterResult register(String code) {

        GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(code, "register"));

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
        return new RegisterResult(userId);
    }

    @Transactional
    public void revoke(OAuthRevokeCommand command) {

        final String authorizationCode = command.authorizationCode();
        final String userId = command.userId();

        GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(authorizationCode, "revoke"));

        final boolean isUserMatched = Objects.equals(userId, getIdResult.id());

        if (!isUserMatched) {
            throw new AuthorizeFailedException();
        }

        oauthProvider.revoke(new RevokeCommand(getIdResult.token()));

        User user = userRepository.findByOpenId(userId)
                .orElseThrow(() -> new EntityNotFoundException(User.class));

        // TODO: Soft Delete 를 구현해 회원 탈퇴/정지 기록을 보존한다.
        userRepository.delete(user);

    }

}
