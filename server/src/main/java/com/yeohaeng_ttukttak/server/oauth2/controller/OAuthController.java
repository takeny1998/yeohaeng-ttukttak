package com.yeohaeng_ttukttak.server.oauth2.controller;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRegisterRequest;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRegisterResponse;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRevokeRequest;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthRegisterCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRevokeCommand;
import jakarta.servlet.http.HttpServletRequest;
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

    private OAuthService getService(String uri) {
        return switch (uri) {
            case "/api/v2/oauth2/google" -> googleOAuthService;
            case "/api/v2/oauth2/apple" -> appleOAuthService;
            default -> throw new RuntimeException();
        };
    }

    @PostMapping({"/google", "/apple"})
    public ServerResponse<OAuthRegisterResponse> register(
            HttpServletRequest servletRequest,
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody OAuthRegisterRequest request) {

        OAuthRegisterCommand command = new OAuthRegisterCommand(
                        request.authorizationCode(), deviceId, deviceName, request.notificationToken());

        String uri = servletRequest.getRequestURI();
        final OAuthService oauthService = getService(uri);


        return new ServerResponse<>(oauthService.register(command).toResponse());

    }

    @DeleteMapping({"/google", "/apple"})
    public ResponseEntity<Void> revoke(
            HttpServletRequest servletRequest,
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody OAuthRevokeRequest request,
            @Authorization String userId) {

        log.debug("[OAuthController.revokeApple] request={}, userId={}", request, userId);

        String uri = servletRequest.getRequestURI();
        final OAuthService oauthService = getService(uri);

        OAuthRevokeCommand command = new OAuthRevokeCommand(request.authorizationCode(), userId, deviceId);
        oauthService.revoke(command);

        return ResponseEntity.noContent().build();
    }

}
