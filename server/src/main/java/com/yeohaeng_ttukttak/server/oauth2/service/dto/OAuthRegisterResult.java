package com.yeohaeng_ttukttak.server.oauth2.service.dto;

import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRegisterResponse;

public record OAuthRegisterResult(
        String accessToken,
        String refreshToken,
        long expiresIn
) {

    public OAuthRegisterResponse toResponse() {
        return new OAuthRegisterResponse(accessToken, refreshToken, expiresIn);
    }

}
