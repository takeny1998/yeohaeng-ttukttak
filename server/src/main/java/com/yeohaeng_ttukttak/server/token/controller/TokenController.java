package com.yeohaeng_ttukttak.server.token.controller;

import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenRequest;
import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenResponse;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v2/tokens")
@RequiredArgsConstructor
public class TokenController {

    private final JwtService jwtService;

    @PostMapping("/renew")
    public RenewTokenResponse renew(@RequestBody RenewTokenRequest request) {

        IssueAuthTokensResult result = jwtService.renewAuthToken(request.refreshToken());

        return new RenewTokenResponse(result.accessToken(), result.refreshToken());

    }

}
