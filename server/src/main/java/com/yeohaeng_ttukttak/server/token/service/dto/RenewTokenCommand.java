package com.yeohaeng_ttukttak.server.token.service.dto;

public record RenewTokenCommand(
        String refreshToken,
        String deviceId
) { }