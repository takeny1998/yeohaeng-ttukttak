package com.yeohaeng_ttukttak.server.domain.auth.service;

import com.yeohaeng_ttukttak.server.domain.auth.AccessTokenProperties;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthorizationDto;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.jwt.service.JwtService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class AccessTokenService {

    private final JwtService jwtService;
    private final AccessTokenProperties properties;

    /**
     * 사용자 정보를 바탕으로 새로운 JWT 토큰을 발행한다.
     * @param authorization 인증 정보를 담을 DTO
     * @return 문자열로 인코딩된 JWT 토큰
     */
    public String create(AuthorizationDto authorization) {
        final Duration expiration = properties.expiration();
        final String secret = properties.secret();
        final String issuer = properties.issuer();

        return jwtService.issueByHS256(secret, issuer, expiration, authorization.toClaims());
    }

    public AuthorizationDto decode(String encodedAuthorization) {
        final Map<String, JwtClaim> claims = jwtService.verifyByHS256(
                encodedAuthorization, properties.secret(), properties.issuer());

        return AuthorizationDto.fromClaims(claims);
    }

}
