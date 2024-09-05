package com.yeohaeng_ttukttak.server.token.controller;

import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.token.controller.dto.DeleteTokenRequest;
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
    public ServerResponse<RenewTokenResponse> renew(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody RenewTokenRequest request) {

        RenewTokenCommand command =
                new RenewTokenCommand(request.refreshToken(), deviceId, deviceName);

        return new ServerResponse<>(jwtService.renew(command).toResponse());

    }

    @DeleteMapping
    public ServerResponse<Void> delete(
            @RequestHeader("Device-Id") String deviceId,
            @RequestHeader("Device-Name") String deviceName,
            @RequestBody DeleteTokenRequest request,
            @Authorization String userId) {

        jwtService.deleteAuthToken(request.refreshToken(), deviceId);

        return new ServerResponse<>(null);
    }


}
