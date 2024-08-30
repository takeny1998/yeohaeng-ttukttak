package com.yeohaeng_ttukttak.server.oauth2.controller.dto;

public record OAuthRegisterResponse(
        String accessToken,
        String refreshToken,
        long expiresIn
) { }