package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.client;

import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@Component
@HttpExchange("https://appleid.apple.com")
public interface AppleOAuthClient {

    @PostExchange(value = "/auth/token", contentType = "application/x-www-form-urlencoded")
    ExchangeTokenResponse exchangeToken(
            @RequestParam String code,
            @RequestParam("client_id") String clientId,
            @RequestParam("client_secret") String clientSecret,
            @RequestParam("grant_type") String grantType);

    @PostExchange(value = "/auth/revoke", contentType = "application/x-www-form-urlencoded")
    void revokeToken(
            @RequestParam String token,
            @RequestParam("client_id") String clientId,
            @RequestParam("client_secret") String clientSecret);

}
