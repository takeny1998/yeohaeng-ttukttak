package com.yeohaeng_ttukttak.server.token.controller;

import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenRequest;
import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenResponse;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v2/tokens")
@RequiredArgsConstructor
public class TokenController {

    private final JwtService jwtService;

    @PostMapping("/renew")
    public RenewTokenResponse renew(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody RenewTokenRequest request) {

        RenewTokenCommand command =
                new RenewTokenCommand(request.refreshToken(), deviceId, deviceName);

        return jwtService.renew(command).toResponse();

    }

    @DeleteMapping()
    public ResponseEntity<Void> delete(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @Authorization String userId) {

        jwtService.deleteAuthToken(userId, deviceId);

        return ResponseEntity.noContent().build();
    }


}
