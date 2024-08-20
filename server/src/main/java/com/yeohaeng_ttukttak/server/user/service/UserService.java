package com.yeohaeng_ttukttak.server.user.service;

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

    public void signUp(String code) {

        ExchangeTokenRequest tokenRequest = new ExchangeTokenRequest(oauthClient, code);
        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(tokenRequest);

        log.info("response={}", tokenResponse);

        String authHeader = "Bearer " + tokenResponse.accessToken();
        GetProfileResponse profileResponse = googleProfileClient.getProfile(authHeader);

        log.info("profile={}", profileResponse);

    }

}
