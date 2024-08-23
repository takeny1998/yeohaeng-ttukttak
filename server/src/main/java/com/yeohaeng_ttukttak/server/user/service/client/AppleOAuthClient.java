package com.yeohaeng_ttukttak.server.user.service.client;

import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@Component
@HttpExchange("https://appleid.apple.com")
public interface AppleOAuthClient {

    @PostExchange("/auth/oauth2/v2/token")
    ExchangeTokenResponse exchangeToken(ExchangeTokenRequest request);

}
