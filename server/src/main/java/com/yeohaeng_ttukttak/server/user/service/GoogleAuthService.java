package com.yeohaeng_ttukttak.server.user.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.domain.auth.OAuth;
import com.yeohaeng_ttukttak.server.user.domain.auth.OAuthProvider;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.property.GoogleOAuthProperties;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.user.service.client.dto.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.service.dto.RegisterResult;
import com.yeohaeng_ttukttak.server.user.service.property.JwtProperties;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.function.Supplier;


@Slf4j
@Service
@AllArgsConstructor
public class GoogleAuthService {

    private final GoogleOAuthProperties oauthProps;
    private final GoogleOAuthClient googleOAuthClient;

    private final GoogleProfileClient googleProfileClient;

    private final UserRepository userRepository;

    private final TokenService tokenService;

    public RegisterResult register(String code) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(oauthProps, code));

        log.debug("response={}", tokenResponse);

        DecodedJWT jwt = JWT.decode(tokenResponse.idToken());
        String openId = jwt.getSubject();

        User user = userRepository.findByOpenId(openId)
                .orElseGet(() -> {

                    String nickname = jwt.getClaim("name").asString();
                    String name = String.valueOf(nickname);

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

    public void revoke(String code) {



    }

}
