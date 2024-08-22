package com.yeohaeng_ttukttak.server.user.service.client;

import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.service.annotation.HttpExchange;
import org.springframework.web.service.annotation.PostExchange;

@Component
@HttpExchange("https://oauth2.googleapis.com")
public interface GoogleOAuthClient {

    @PostExchange("/token")
    ExchangeTokenResponse exchangeToken(
            @RequestBody ExchangeTokenRequest request);

}
