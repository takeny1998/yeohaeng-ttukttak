package com.yeohaeng_ttukttak.server.user.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.domain.auth.OAuth;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.user.service.dto.GetIdentificationCommand;
import com.yeohaeng_ttukttak.server.user.service.dto.Identification;
import com.yeohaeng_ttukttak.server.user.service.dto.Profile;
import com.yeohaeng_ttukttak.server.user.service.dto.RegisterResult;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
public class OAuthService {

    private final OAuthProvidable oauthProvider;

    private final UserRepository userRepository;

    private final TokenService tokenService;

    public RegisterResult register(String code) {

        Identification identification = oauthProvider.getIdentification(
                new GetIdentificationCommand(code));

        String openId = identification.id();
        String name = identification.name();

        User user = userRepository.findByOpenId(openId)
                .orElseGet(() -> {
                    Profile profile = oauthProvider.getProfile();
                    OAuth oauth = new OAuth(openId, oauthProvider.getProvider());
                    User newUser = new User(oauth, name, profile.gender(), profile.birthday());

                    userRepository.save(newUser);
                    return newUser;
                });

        log.debug("user={}", user);

        String accessToken = tokenService.issueAccessToken(openId);
        String refreshToken = tokenService.issueRefreshToken(openId);

        return new RegisterResult(accessToken, refreshToken);

    }

    public void revoke(String code) {

        Identification identification =
                oauthProvider.getIdentification(new GetIdentificationCommand(code));

        oauthProvider.revoke(identification);

        User user = userRepository.findByOpenId(identification.id())
                .orElseThrow(() -> new EntityNotFoundException(User.class));

        // TODO: Soft Delete 를 구현해 회원 탈퇴/정지 기록을 보존한다.
        userRepository.delete(user);

    }

}
