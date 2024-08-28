package com.yeohaeng_ttukttak.server.token.controller;

import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenRequest;
import com.yeohaeng_ttukttak.server.token.controller.dto.RenewTokenResponse;
import com.yeohaeng_ttukttak.server.token.service.TokenService;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenCommand;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2/tokens")
@RequiredArgsConstructor
public class TokenController {

    private final TokenService tokenService;

    @PostMapping("/renew")
    public RenewTokenResponse renew(
            @RequestHeader("Device-Id") String deviceId,
            @RequestBody RenewTokenRequest request) {

        RenewTokenCommand command =
                new RenewTokenCommand(request.refreshToken(), deviceId);

        return tokenService.renew(command).toResponse();

    }

}
