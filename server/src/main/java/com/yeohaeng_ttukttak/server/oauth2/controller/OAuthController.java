package com.yeohaeng_ttukttak.server.oauth2.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthResponse;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RegisterResult;
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

    @PostMapping("/apple/register")
    public ResponseEntity<Void> registerApple(@RequestParam String code) throws JsonProcessingException {
        RegisterResult result = appleOAuthService.register(code);

        String redirectUri = UriComponentsBuilder
                .fromUriString("com.yeohaeng-ttukttak.application:/")
                .queryParam("response", StringUtil.toJsonString(result))
                .encode()
                .toUriString();

        return ResponseEntity.status(HttpStatus.FOUND)
                .header("Location", redirectUri)
                .build();
    }

    @PostMapping("/apple/revoke")
    public ResponseEntity<Void> revokeApple(@RequestParam String code) {
        appleOAuthService.revoke(code);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/google/register")
    public ResponseEntity<Void> registerGoogle(@RequestParam String code) {
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
        return ResponseEntity.noContent().build();
    }
}
