package com.yeohaeng_ttukttak.server.user.service.client.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.yeohaeng_ttukttak.server.user.service.client.property.GoogleOAuthProperties;

public record ExchangeTokenRequest (
        String code,
        @JsonProperty("client_id") String clientId,
        @JsonProperty("client_secret") String clientSecret,
        @JsonProperty("grant_type") String grantType,
        @JsonProperty("redirect_uri") String redirectUri
) {

    public ExchangeTokenRequest(GoogleOAuthProperties client, String code) {
        this(code, client.clientId(), client.clientSecret(),
                client.grantType(), client.redirectUri());
    }

}