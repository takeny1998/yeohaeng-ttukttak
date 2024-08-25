package com.yeohaeng_ttukttak.server.token;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yeohaeng_ttukttak.server.common.util.KeyUtils;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.token.exception.JwtSignatureFailedException;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import lombok.extern.slf4j.Slf4j;

import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.ECPrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.time.Duration;
import java.time.Instant;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class JavaJwtTokenService implements TokenService {

    private final JwtProperties jwtProps;
    private final Algorithm algorithm;

    public JavaJwtTokenService(JwtProperties jwtProps) {
        this.jwtProps = jwtProps;
        algorithm = Algorithm.HMAC256(jwtProps.secret());
    }

    @Override
    public String issueByHS256(Duration expiration, Map<String, Object> claims) {

        Instant issuedAt = Instant.now();
        Instant expiresAt = issuedAt.plusSeconds(expiration.toSeconds());

        return JWT.create()
                .withIssuer(jwtProps.issuer())
                .withPayload(claims)
                .withIssuedAt(issuedAt)
                .withExpiresAt(expiresAt)
                .sign(algorithm);
    }

    @Override
    public String issueByES256(String privateKey,
                               Duration expiration,
                               Map<String, Object> headers,
                               Map<String, Object> claims) {

        final byte[] keyBytes = Base64.getDecoder().decode(privateKey);
        final PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);

        final Algorithm algorithm;

        try {

            final KeyFactory keyFactory = KeyFactory.getInstance("EC");
            algorithm = Algorithm.ECDSA256(
                    (ECPrivateKey) keyFactory.generatePrivate(keySpec));

        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {

            throw new JwtSignatureFailedException(ex.getMessage(), ex.getCause());

        }

        Instant issuedAt = Instant.now();
        Instant expiresAt = issuedAt.plusSeconds(expiration.toSeconds());

        return JWT.create()
                .withIssuedAt(issuedAt)
                .withExpiresAt(expiresAt)
                .withHeader(headers)
                .withPayload(claims)
                .sign(algorithm);

    }

    @Override
    public Map<String, Object> decode(String token) {

        DecodedJWT jwt = JWT.decode(token);

        return new HashMap<>(jwt.getClaims());

    }

}
