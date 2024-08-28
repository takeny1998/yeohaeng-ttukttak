package com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token;

import java.time.LocalDateTime;

public record IssueAuthTokensResult(
        String accessToken,
        String refreshToken,
        LocalDateTime expiresAt
) { }
