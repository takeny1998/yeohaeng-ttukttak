package com.yeohaeng_ttukttak.server.user.controller.dto;

public record OAuthRequest(

        String code,
        OAuthState state

) { }
