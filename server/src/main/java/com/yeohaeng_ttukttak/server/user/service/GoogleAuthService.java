package com.yeohaeng_ttukttak.server.user.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.domain.auth.OAuth;
import com.yeohaeng_ttukttak.server.user.domain.auth.OAuthProvider;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.dto.RevokeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.property.GoogleOAuthProperties;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.user.service.client.dto.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.service.dto.RegisterResult;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import com.yeohaeng_ttukttak.server.user.service.token.dto.IdTokenClaim;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Slf4j
@Service
@AllArgsConstructor
public class GoogleAuthService implements AuthService {

    private final GoogleOAuthProperties oauthProps;
    private final GoogleOAuthClient googleOAuthClient;

    private final GoogleProfileClient googleProfileClient;

    private final UserRepository userRepository;

    private final TokenService tokenService;

    @Override
    public RegisterResult register(String code) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(oauthProps, code));

        log.debug("response={}", tokenResponse);

        IdTokenClaim idTokenClaim = tokenService.decodeIdToken(tokenResponse.idToken());
        String openId = idTokenClaim.openId();
        String name = idTokenClaim.name();

        User user = userRepository.findByOpenId(idTokenClaim.openId())
                .orElseGet(() -> {

                    GetProfileResponse profileResponse = googleProfileClient.getProfile();

                    log.debug("profile={}", profileResponse);

                    User newUser = new User(new OAuth(openId, OAuthProvider.GOOGLE),
                            name, profileResponse.gender(), profileResponse.birthday());

                    userRepository.save(newUser);
                    return newUser;

                });

        log.debug("user={}", user);

        String accessToken = tokenService.issueAccessToken(openId);
        String refreshToken = tokenService.issueRefreshToken(openId);

        return new RegisterResult(accessToken, refreshToken);

    }

    @Override
    public void revoke(String code) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(
                        code,
                        oauthProps.clientId(),
                        oauthProps.clientSecret(),
                        oauthProps.grantType(),
                        oauthProps.domain() + "/api/v2/users/google/revoke"));

        log.debug("response={}", tokenResponse);

        IdTokenClaim idTokenClaim = tokenService.decodeIdToken(tokenResponse.idToken());

        googleOAuthClient.revokeToken(new RevokeTokenRequest(tokenResponse.accessToken()));

        User user = userRepository.findByOpenId(idTokenClaim.openId())
                .orElseThrow(() -> new EntityNotFoundException(User.class));

        // TODO: Soft Delete 를 구현해 회원 탈퇴/정지 기록을 보존한다.
        userRepository.delete(user);

    }

}
