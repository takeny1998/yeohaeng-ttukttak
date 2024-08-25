package com.yeohaeng_ttukttak.server.oauth2.service.dto;

public record RegisterResult(
        String accessToken,
        String refreshToken
) { }
