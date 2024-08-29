package com.yeohaeng_ttukttak.server.token.service.dto;

import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenResponse;

public record RenewTokenResult(
        String accessToken,
        String refreshToken
) {

    public RenewTokenResponse toResponse() {
        return new RenewTokenResponse(accessToken, refreshToken);
    }

}
