package com.yeohaeng_ttukttak.server.oauth2.controller.dto;

public record OAuthRegisterRequest(
        String authorizationCode,
        String notificationToken
) { }
