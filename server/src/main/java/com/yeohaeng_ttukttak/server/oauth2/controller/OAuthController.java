package com.yeohaeng_ttukttak.server.oauth2.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.yeohaeng_ttukttak.server.common.exception.exception.bad_request.RequiredFieldMissingException;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRedirectResponse;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthSession;
import com.yeohaeng_ttukttak.server.oauth2.repository.OAuthSessionRepository;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RegisterResult;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.AppleOAuthProps;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Enumeration;
import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("/api/v2/oauth2")
@RequiredArgsConstructor
public class OAuthController {

    private final OAuthService googleOAuthService;
    private final OAuthService appleOAuthService;

    private final OAuthSessionRepository sessionRepository;
    private final AppleOAuthProps appleOAuthProps;


    @GetMapping(value = "/apple")
    public OAuthRedirectResponse apple(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestParam("action") String action) {

        OAuthSession session = new OAuthSession(deviceId, deviceName);

        sessionRepository.save(session);

        String redirectUri = UriComponentsBuilder.newInstance()
                .scheme("https")
                .host("appleid.apple.com")
                .path("/auth/authorize")
                .queryParam("client_id", appleOAuthProps.clientId())
                .queryParam("response_mode", "form_post")
                .queryParam("response_type", "code")
                .queryParam("redirect_uri", appleOAuthProps.redirectUri() + "/" + action)
                .queryParam("scope", "email")
                .queryParam("state", session.id())
                .encode().toUriString();

        return new OAuthRedirectResponse(redirectUri);

    }

    @PostMapping("/apple/register")
    public ResponseEntity<Void> registerApple(@RequestParam String code,
                                              @RequestParam String state) throws JsonProcessingException {

        RegisterResult result = appleOAuthService.register(code, state);

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

        String redirectUri = UriComponentsBuilder
                .fromUriString("com.yeohaeng-ttukttak.application:/")
                .encode().toUriString();

        return ResponseEntity.status(HttpStatus.FOUND)
                .header("Location", redirectUri)
                .build();
    }

    @GetMapping("/google/register")
    public ResponseEntity<Void> registerGoogle(@RequestParam String code, @RequestParam String state) {
        RegisterResult result = googleOAuthService.register(code, state);

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
