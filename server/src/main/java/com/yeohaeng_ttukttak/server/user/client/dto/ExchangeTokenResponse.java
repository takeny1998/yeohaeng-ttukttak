package com.yeohaeng_ttukttak.server.user.client.dto;


import com.fasterxml.jackson.annotation.JsonProperty;

public record ExchangeTokenResponse (
        @JsonProperty("access_token") String accessToken,
        @JsonProperty("refresh_token") String refreshToken
) { }
