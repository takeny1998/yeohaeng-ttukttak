package com.yeohaeng_ttukttak.server.oauth2.controller;

import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthResponse;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RegisterResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/v2/oauth2")
@RequiredArgsConstructor
public class OAuthController {

    private final OAuthService googleOAuthService;
    private final OAuthService appleOAuthService;

    @PostMapping("/apple/register")
    public OAuthResponse registerApple(@RequestParam String code) {
        RegisterResult result = appleOAuthService.register(code);
        return new OAuthResponse(result.accessToken(), result.refreshToken());
    }

    @PostMapping("/apple/revoke")
    public ResponseEntity<Void> revokeApple(@RequestParam String code) {
        appleOAuthService.revoke(code);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/google/register")
    public OAuthResponse registerGoogle(@RequestParam String code) {
        RegisterResult result = googleOAuthService.register(code);
        return new OAuthResponse(result.accessToken(), result.refreshToken());
    }

    @GetMapping("/google/revoke")
    public ResponseEntity<Void> revokeGoogle(@RequestParam String code) {
        googleOAuthService.revoke(code);
        return ResponseEntity.noContent().build();
    }
}
