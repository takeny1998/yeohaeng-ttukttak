package com.yeohaeng_ttukttak.server.user.service.token;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.RSAKeyProvider;
import com.yeohaeng_ttukttak.server.user.service.property.JwtProperties;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.time.Instant;

public class JavaJwtTokenService implements TokenService {

    private final JwtProperties jwtProps;
    private final Algorithm algorithm;

    public JavaJwtTokenService(JwtProperties jwtProps) {
        this.jwtProps = jwtProps;
        algorithm = Algorithm.HMAC256(jwtProps.secret());
    }

    @Override
    public String issueAccessToken(String openId) {

        Instant issuedAt = Instant.now();
        Instant expiresAt = issuedAt.plusSeconds(
                jwtProps.accessToken().expiration().toSeconds());

        return JWT.create()
                .withIssuer(jwtProps.issuer())
                .withClaim("open_id", openId)
                .withIssuedAt(issuedAt)
                .withExpiresAt(expiresAt)
                .sign(algorithm);

    }

    @Override
    public String issueRefreshToken(String openId) {

        Instant issuedAt = Instant.now();
        Instant expiresAt = issuedAt.plusSeconds(
                jwtProps.refreshToken().expiration().toSeconds());

        return JWT.create()
                .withIssuer(jwtProps.issuer())
                .withClaim("open_id", openId)
                .withIssuedAt(issuedAt)
                .withExpiresAt(expiresAt)
                .sign(algorithm);

    }

    @Override
    public String decodeIdToken(String idToken) {


        return null;
    }

    @Override
    public String renewAccessToken() {
        return null;
    }
}
