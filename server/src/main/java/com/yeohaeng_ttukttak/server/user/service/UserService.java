package com.yeohaeng_ttukttak.server.user.service;

import com.auth0.jwt.JWT;
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
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Slf4j
@Service
@AllArgsConstructor
public class UserService {

    private final GoogleOAuthProperties oauthClient;
    private final GoogleOAuthClient googleOAuthClient;

    private final GoogleProfileClient googleProfileClient;

    private final UserRepository userRepository;

    public User signUp(String code) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(oauthClient, code));

        log.info("response={}", tokenResponse);

        DecodedJWT jwt = JWT.decode(tokenResponse.idToken());

        String openId = jwt.getSubject();

        User user = userRepository.findByOpenId(openId)
                .orElseGet(() -> {

                    String nickname = jwt.getClaim("name").asString();
                    String name = String.valueOf(nickname);

                    GetProfileResponse profileResponse = googleProfileClient.getProfile();

                    log.info("profile={}", profileResponse);

                    User newUser = new User(new OAuth(openId, OAuthProvider.GOOGLE),
                            name, profileResponse.gender(), profileResponse.birthday());

                    userRepository.save(newUser);
                    return newUser;
                    
                });

        log.info("user={}", user);

        return user;
    }

    public void revoke(String code) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(oauthClient, code));

    }

}
