package com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token;

import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRegisterResult;

public record IssueAuthTokensResult(
        String accessToken,
        String refreshToken,
        long expiresIn
) {

    public OAuthRegisterResult toRegisterResult() {
        return new OAuthRegisterResult(accessToken, refreshToken, expiresIn);
    }
}
