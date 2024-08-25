package com.yeohaeng_ttukttak.server.user.service.client;

import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
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
            @RequestParam("grant_type") String grantType,
            @RequestParam("redirect_uri") String redirectUri);

    @PostExchange(value = "/auth/revoke", contentType = "application/x-www-form-urlencoded")
    void revokeToken(
            @RequestParam String token,
            @RequestParam("client_id") String clientId,
            @RequestParam("client_secret") String clientSecret);

}
