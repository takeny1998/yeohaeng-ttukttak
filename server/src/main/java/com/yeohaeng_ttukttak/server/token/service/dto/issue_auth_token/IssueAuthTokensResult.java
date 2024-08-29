package com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token;

import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthResponse;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenResult;

import java.time.LocalDateTime;

public record IssueAuthTokensResult(
        String accessToken,
        String refreshToken
) { }
