package com.yeohaeng_ttukttak.server.token.controller;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenRequest;
import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenResponse;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenCommand;
import com.yeohaeng_ttukttak.server.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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

}
