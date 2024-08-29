package com.yeohaeng_ttukttak.server.token.provider.java_jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.token.exception.JwtSignatureFailedException;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.provider.JwtClaim;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
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
import java.util.stream.Collectors;

@Slf4j
public class JavaJwtProvider implements JwtProvidable {

    private final JwtProperties jwtProps;
    private final Algorithm hs256;

    public JavaJwtProvider(JwtProperties jwtProps) {
        this.jwtProps = jwtProps;
        hs256 = Algorithm.HMAC256(jwtProps.secret());
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
                .sign(hs256);
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
            throw new JwtSignatureFailedException(ex);
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
    public Map<String, JwtClaim> decode(String token) {

        DecodedJWT jwt = JWT.decode(token);

        return jwt.getClaims().entrySet().stream()
                .collect(Collectors.toMap(Map.Entry::getKey,
                        e -> new JavaJwtClaim(e.getValue())));

    }

    @Override
    public Map<String, JwtClaim> verifyByHS256(String token) {

        JWTVerifier verifier = JWT.require(hs256)
                .withIssuer("yeohaeng-ttukttak.com")
                .build();

        final Map<String, Claim> claims;

        try {
            claims = verifier.verify(token).getClaims();
        } catch (TokenExpiredException ex) {
            throw new AuthorizationExpiredException(ex);
        } catch (JWTVerificationException ex) {
            throw new AuthorizeFailedException(ex);
        }

        return claims.entrySet().stream()
                .collect(Collectors.toMap(Map.Entry::getKey,
                        e -> new JavaJwtClaim(e.getValue())));

    }



}
