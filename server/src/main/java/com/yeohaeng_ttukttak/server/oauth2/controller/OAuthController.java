package com.yeohaeng_ttukttak.server.oauth2.controller;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRegisterRequest;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRegisterResponse;
import com.yeohaeng_ttukttak.server.oauth2.controller.dto.OAuthRevokeRequest;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthRegisterCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.OAuthRegisterResult;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
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

    @PostMapping("/apple")
    public OAuthRegisterResponse registerApple(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody OAuthRegisterRequest request) {

        OAuthRegisterCommand command = new OAuthRegisterCommand(
                        request.authorizationCode(), deviceId, deviceName);

        return appleOAuthService.register(command).toResponse();

    }

    @DeleteMapping("/apple")
    public ResponseEntity<Void> revokeApple(
            @RequestBody OAuthRevokeRequest request,
            @Authorization String userId) {

        log.debug("[OAuthController.revokeApple] request={}, userId={}", request, userId);

        OAuthRevokeCommand command = new OAuthRevokeCommand(request.authorizationCode(), userId);
        appleOAuthService.revoke(command);

        return ResponseEntity.noContent().build();
    }

}
