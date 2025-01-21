package com.yeohaeng_ttukttak.server.domain.auth.service;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.auth.RefreshTokenProperties;
import com.yeohaeng_ttukttak.server.domain.auth.entity.RefreshToken;
import com.yeohaeng_ttukttak.server.domain.auth.repository.RefreshTokenRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Slf4j
@Service
@RequiredArgsConstructor
public class RefreshTokenService {

    private final RefreshTokenProperties properties;
    private final RefreshTokenRepository repository;

    public String create(String userId) {
        final String refreshToken = StringUtil.createShortUUID();
        long expirationSeconds = properties.expiration().getSeconds();

        repository.save(new RefreshToken(
                refreshToken, userId, expirationSeconds));

        return refreshToken;
    }

    public void revoke(RefreshToken refreshToken) {
        refreshToken.setExpiredAt(LocalDateTime.now());

        repository.save(refreshToken);
    }
    
    public RefreshToken verify(String refreshToken) {

        // TODO: 찾지 못한다면 인증이 없거나 만료된 것
        final RefreshToken existToken = repository.findById(refreshToken)
                .orElseThrow(ExceptionCode.AUTHENTICATION_FAIL::wrap);

        log.debug("[RefreshTokenService.verify] existToken = {}", existToken);

        final boolean isUsedBefore = existToken.expiredAt() != null;
        if (isUsedBefore) {
            // TODO: Refresh Token이 재사용 됨, 모든 토큰을 무효화 시킨다.
            repository.findAllByMemberId(existToken.memberId()).forEach(this::revoke);
            throw ExceptionCode.AUTHENTICATION_FAIL.wrap();
        }

        return existToken;

    }

}
