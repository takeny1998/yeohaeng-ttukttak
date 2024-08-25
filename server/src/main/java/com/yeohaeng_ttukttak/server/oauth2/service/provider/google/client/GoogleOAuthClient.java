package com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client;

import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.revoke_token.RevokeTokenRequest;
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

    @PostExchange("/revoke")
    void revokeToken(@RequestBody RevokeTokenRequest request);

}
