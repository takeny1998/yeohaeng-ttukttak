package com.yeohaeng_ttukttak.server.token.provider.java_jwt;

import com.auth0.jwk.Jwk;
import com.auth0.jwk.JwkException;
import com.auth0.jwk.JwkProvider;
import com.auth0.jwk.JwkProviderBuilder;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.RSAKeyProvider;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.token.exception.JwtSignatureFailedException;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.provider.JwtClaim;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.client.HttpServerErrorException;

import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.time.Duration;
import java.time.Instant;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toMap;

@Slf4j
public class JavaJwtProvider implements JwtProvidable {

    private final JwtProperties jwtProps;
    private final Algorithm HS256, RSA256;

    private final JWTVerifier HS256_VERIFIER, RSA256_VERIFIER;

    public JavaJwtProvider(JwtProperties jwtProps) {
        this.jwtProps = jwtProps;

        HS256 = Algorithm.HMAC256(jwtProps.secret());
        HS256_VERIFIER = JWT.require(HS256)
                .withIssuer("yeohaeng-ttukttak.com")
                .build();

        final JwkProvider jwkProvider = new JwkProviderBuilder("https://appleid.apple.com/auth/keys")
                        .cached(3, 7, TimeUnit.DAYS)
                        .build();

        RSA256 = Algorithm.RSA256(new JavaJwtRsaKeyProvider(jwkProvider));
        RSA256_VERIFIER = JWT.require(RSA256)
                .withIssuer("https://appleid.apple.com")
                .withAudience("com.yeohaeng-ttukttak.application")
                .build();

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
                .sign(HS256);
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
                .collect(toMap(Entry::getKey,
                        e -> new JavaJwtClaim(e.getValue())));

    }

    @Override
    public Map<String, JwtClaim> verifyByHS256(String token) {
        return verify(HS256_VERIFIER, token);
    }

    @Override
    public Map<String, JwtClaim> verifyByRSA256(String token) {
        return verify(RSA256_VERIFIER, token);
    }

    private Map<String, JwtClaim> verify(JWTVerifier verifier, String token) {
        final Map<String, Claim> claims;

        try {
            claims = verifier.verify(token).getClaims();
        } catch (TokenExpiredException ex) {
            throw new AuthorizationExpiredException(ex);
        } catch (JWTVerificationException ex) {
            throw new AuthorizeFailedException(ex);
        }

        return claims.entrySet().stream()
                .collect(toMap(Entry::getKey, e -> new JavaJwtClaim(e.getValue())));
    }


}
