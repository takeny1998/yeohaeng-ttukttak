package com.yeohaeng_ttukttak.server.user.service.dto;

public record RegisterResult(
        String accessToken,
        String refreshToken
) { }
