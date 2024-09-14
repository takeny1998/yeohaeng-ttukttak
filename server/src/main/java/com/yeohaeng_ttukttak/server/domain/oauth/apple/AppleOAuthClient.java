package com.yeohaeng_ttukttak.server.domain.oauth.apple;

import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@HttpExchange("https://appleid.apple.com")
public interface AppleOAuthClient {

    @PostExchange(value = "/auth/token?grant_type=authorization_code", contentType = "application/x-www-form-urlencoded")
    TokenDto getToken(
            @RequestParam("code") String authorizationCode,
            @RequestParam("client_id") String clientId,
            @RequestParam("client_secret") String clientSecret);

    @PostExchange(value = "/auth/revoke", contentType = "application/x-www-form-urlencoded")
    void revokeToken(
            @RequestParam String token,
            @RequestParam("client_id") String clientId,
            @RequestParam("client_secret") String clientSecret);

}
