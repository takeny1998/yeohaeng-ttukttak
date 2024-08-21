package com.yeohaeng_ttukttak.server.user.service.client.dto;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public record ExchangeTokenResponse (
        @JsonProperty("access_token") String accessToken,
        @JsonProperty("id_token") String idToken
) { }
