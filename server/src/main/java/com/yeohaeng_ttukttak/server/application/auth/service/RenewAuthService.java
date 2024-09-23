package com.yeohaeng_ttukttak.server.application.auth.service;

import com.yeohaeng_ttukttak.server.application.auth.service.dto.AuthTokenDto;
import com.yeohaeng_ttukttak.server.domain.auth.entity.RefreshToken;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.auth.service.RefreshTokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class RenewAuthService {

    private final AccessTokenService accessTokenService;
    private final RefreshTokenService refreshTokenService;

    @Transactional
    public AuthTokenDto call(String refreshToken) {
        final RefreshToken verifiedToken = refreshTokenService.verify(refreshToken);
        final String userId = verifiedToken.userId();

        refreshTokenService.revoke(verifiedToken);

        return new AuthTokenDto(
                accessTokenService.create(userId),
                refreshTokenService.create(userId));
    }

}
