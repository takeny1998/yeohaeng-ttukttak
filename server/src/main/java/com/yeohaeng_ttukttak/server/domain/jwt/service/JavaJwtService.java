package com.yeohaeng_ttukttak.server.domain.jwt.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JavaJwtClaim;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.Instant;
import java.util.Map;

import static java.util.stream.Collectors.toMap;

@Service
public class JavaJwtService implements JwtService {

    @Override
    public String issueByHS256(String secret, String issuer, Duration expiration, Map<String, Object> claims) {

        final Algorithm HS256 = Algorithm.HMAC256(secret);

        Instant issuedAt = Instant.now();
        Instant expiresAt = issuedAt.plusSeconds(expiration.toSeconds());

        return JWT.create()
                .withIssuer(issuer)
                .withPayload(claims)
                .withIssuedAt(issuedAt)
                .withExpiresAt(expiresAt)
                .sign(HS256);
    }

    @Override
    public String issueByES256(String privateKey, Duration expiration, Map<String, Object> headers, Map<String, Object> claims) {
        return null;
    }

    @Override
    public Map<String, JwtClaim> decode(String jwtToken) {
        final var claims = JWT.decode(jwtToken).getClaims();

        return claims.entrySet().stream()
                .collect(toMap(Map.Entry::getKey,
                        e -> new JavaJwtClaim(e.getValue())));
    }

    @Override
    public Map<String, JwtClaim> verifyByHS256(String encodedToken, String secret, String issuer) {

        final Algorithm HS256 = Algorithm.HMAC256(secret);
        DecodedJWT decodedJWT;

        try {
            decodedJWT = JWT.require(HS256)
                    .withIssuer(issuer)
                    .build()
                    .verify(encodedToken);
        } catch (JWTVerificationException ex) {
            final BaseException baseException =
                    ExceptionCode.AUTHORIZATION_FAIL.getInstance();

            baseException.initCause(ex);
            throw baseException;
        }

        return decodedJWT.getClaims()
                .entrySet().stream()
                .collect(toMap(Map.Entry::getKey,
                        e -> new JavaJwtClaim(e.getValue())));
    }


    @Override
    public Map<String, JwtClaim> verifyByRSA256(String jwtToken) {
        return null;
    }

}
