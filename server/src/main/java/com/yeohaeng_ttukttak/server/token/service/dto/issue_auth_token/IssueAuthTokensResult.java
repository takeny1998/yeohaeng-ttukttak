package com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token;

public record IssueAuthTokensResult(
        String accessToken,
        String refreshToken
) { }