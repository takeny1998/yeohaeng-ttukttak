package com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.GoogleOAuthProps;

public record ExchangeTokenRequest (
        String code,
        @JsonProperty("client_id") String clientId,
        @JsonProperty("client_secret") String clientSecret,
        @JsonProperty("grant_type") String grantType,
        @JsonProperty("redirect_uri") String redirectUri
) { }