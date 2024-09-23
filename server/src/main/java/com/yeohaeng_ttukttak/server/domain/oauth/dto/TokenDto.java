package com.yeohaeng_ttukttak.server.domain.oauth.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record TokenDto(
        @JsonProperty("access_token") String accessToken,
        @JsonProperty("id_token") String idToken) { }
