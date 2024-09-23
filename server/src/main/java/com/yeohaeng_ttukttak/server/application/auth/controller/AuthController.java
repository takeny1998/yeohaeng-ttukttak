package com.yeohaeng_ttukttak.server.application.auth.controller;

import com.yeohaeng_ttukttak.server.application.auth.controller.dto.AuthRenewRequest;
import com.yeohaeng_ttukttak.server.application.auth.controller.dto.LoginRequest;
import com.yeohaeng_ttukttak.server.application.auth.controller.dto.LogoutRequest;
import com.yeohaeng_ttukttak.server.application.auth.service.LogoutService;
import com.yeohaeng_ttukttak.server.application.auth.service.RenewAuthService;
import com.yeohaeng_ttukttak.server.application.auth.service.OAuthLoginService;
import com.yeohaeng_ttukttak.server.application.auth.service.dto.AuthTokenDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.oauth.service.GoogleOAuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v2/auth")
@RequiredArgsConstructor
public class AuthController {

    private final OAuthLoginService appleLoginService;
    private final OAuthLoginService googleLoginService;

    private final RenewAuthService renewAuthService;
    private final LogoutService logoutService;

    @PostMapping("/login")
    public ServerResponse<AuthTokenDto> login(@RequestBody LoginRequest request) {
        final String authorizationCode = request.authorizationCode();

        final AuthTokenDto authTokenDto = switch (request.provider()) {
            case APPLE -> appleLoginService.call(authorizationCode);
            case GOOGLE -> googleLoginService.call(authorizationCode);
        };

        return new ServerResponse<>(authTokenDto);
    }

    @PostMapping("/logout")
    public ServerResponse<Void> logout(@RequestBody LogoutRequest request) {
        logoutService.call(request.refreshToken());
        return new ServerResponse<>();
    }

    @PostMapping("/renew")
    public ServerResponse<AuthTokenDto> renew(@RequestBody AuthRenewRequest request) {
        AuthTokenDto authTokenDto = renewAuthService.call(request.refreshToken());
        return new ServerResponse<>(authTokenDto);
    }

}
