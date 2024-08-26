package com.yeohaeng_ttukttak.server.oauth2.controller.dto;

public record OAuthRequest(

        String code,
        OAuthResponse state

) { }
