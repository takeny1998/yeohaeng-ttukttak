package com.yeohaeng_ttukttak.server.oauth2.controller.dto;


public record OAuthRevokeRequest(
        String authorizationCode
) { }