package com.yeohaeng_ttukttak.server.domain.auth.service;

import com.yeohaeng_ttukttak.server.domain.auth.AccessTokenProperties;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
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

    public String create(String userId) {
        final Map<String, Object> claims = Map.of("sub", userId);

        final Duration expiration = properties.expiration();
        final String secret = properties.secret();
        final String issuer = properties.issuer();

        return jwtService.issueByHS256(secret, issuer, expiration, claims);
    }

    public AccessTokenDto decode(String encodedToken) {

        final Map<String, JwtClaim> claims = jwtService.verifyByHS256(
                encodedToken, properties.secret(), properties.issuer());

        final String sub = claims.get("sub").asString();

        return new AccessTokenDto(sub);

    }

}
