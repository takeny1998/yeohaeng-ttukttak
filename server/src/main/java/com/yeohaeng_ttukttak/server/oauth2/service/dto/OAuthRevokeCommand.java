package com.yeohaeng_ttukttak.server.oauth2.service.dto;

public record OAuthRevokeCommand(
        String authorizationCode,
        String userId,
        String deviceId
) { }
