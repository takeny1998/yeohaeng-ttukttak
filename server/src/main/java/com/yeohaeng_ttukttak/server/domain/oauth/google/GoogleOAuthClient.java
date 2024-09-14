package com.yeohaeng_ttukttak.server.domain.oauth.google;

import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@HttpExchange("https://oauth2.googleapis.com")
public interface GoogleOAuthClient {

    @PostExchange(value = "/token?grant_type=authorization_code")
    TokenDto getToken(
            @RequestParam("code") String authorizationCode,
            @RequestParam("client_id") String clientId,
            @RequestParam("client_secret") String clientSecret);

}
