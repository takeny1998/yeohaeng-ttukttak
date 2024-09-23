package com.yeohaeng_ttukttak.server.application.auth.controller.dto;

import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuthProvider;

public record LoginRequest(
        OAuthProvider provider,
        String authorizationCode) { }
