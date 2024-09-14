package com.yeohaeng_ttukttak.server.application.auth.service;

import com.yeohaeng_ttukttak.server.domain.auth.entity.RefreshToken;
import com.yeohaeng_ttukttak.server.domain.auth.service.RefreshTokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class LogoutService {

    private final RefreshTokenService refreshTokenService;

    @Transactional
    public void call(String refreshToken) {
        final RefreshToken verifiedToken = refreshTokenService.verify(refreshToken);
        refreshTokenService.revoke(verifiedToken);
    }

}
