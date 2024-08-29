package com.yeohaeng_ttukttak.server.oauth2.service.provider.dto;

public record RevokeCommand(
        String accessToken
) { }