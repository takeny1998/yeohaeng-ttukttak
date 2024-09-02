package com.yeohaeng_ttukttak.server.token.controller.dto;

public record RenewTokenResponse(
        String accessToken,
        String refreshToken,
        long expiresIn
) { }
