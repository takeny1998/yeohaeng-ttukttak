package com.yeohaeng_ttukttak.server.oauth2.controller;

import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRequest;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthResponse;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RegisterResult;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

@Slf4j
@RestController
@RequestMapping("/api/v2/oauth2")
@RequiredArgsConstructor
public class OAuthController {

    private final OAuthService googleOAuthService;
    private final OAuthService appleOAuthService;
    private final JwtService jwtService;


    @PostMapping("/apple/register")
    public OAuthResponse registerApple(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody OAuthRequest request) {

        log.debug("code={}", request.authorizationCode());

        RegisterResult result = appleOAuthService.register(request.authorizationCode());

        log.debug("result={}", result);

        IssueAuthTokensResult tokenResult = jwtService.issueAuthTokens(
                new IssueAuthTokensCommand(result.userId(), deviceId, deviceName));

        return new OAuthResponse(tokenResult.accessToken(), tokenResult.refreshToken());

    }

    @PostMapping("/apple/revoke")
    public ResponseEntity<Void> revokeApple(@RequestParam String code) {
        appleOAuthService.revoke(code);

        String redirectUri = UriComponentsBuilder
                .fromUriString("com.yeohaeng-ttukttak.application:/")
                .encode().toUriString();

        return ResponseEntity.status(HttpStatus.FOUND)
                .header("Location", redirectUri)
                .build();
    }

    @GetMapping("/google/register")
    public ResponseEntity<Void> registerGoogle(@RequestParam String code, @RequestParam String state) {
        RegisterResult result = googleOAuthService.register(code);

        String redirectUri = UriComponentsBuilder
                .fromUriString("com.yeohaeng-ttukttak.application:/")
                .queryParam("response", result)
                .encode()
                .toUriString();

        return ResponseEntity.status(HttpStatus.FOUND)
                .header("Location", redirectUri)
                .build();
    }

    @GetMapping("/google/revoke")
    public ResponseEntity<Void> revokeGoogle(@RequestParam String code) {
        googleOAuthService.revoke(code);

        String redirectUri = UriComponentsBuilder
                .fromUriString("com.yeohaeng-ttukttak.application:/")
                .encode().toUriString();

        return ResponseEntity.status(HttpStatus.FOUND)
                .header("Location", redirectUri)
                .build();
    }

}
