package com.yeohaeng_ttukttak.server.token;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yeohaeng_ttukttak.server.common.util.KeyUtils;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.token.dto.IdTokenClaim;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;

import java.security.NoSuchAlgorithmException;
import java.security.interfaces.ECPrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.time.Duration;
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
    public IdTokenClaim decodeIdToken(String idToken) {

        DecodedJWT jwt = JWT.decode(idToken);

        return new IdTokenClaim(
                jwt.getSubject(),
                jwt.getClaim("name").asString());

    }

    @Override
    public String generateClientSecret(AppleOAuthProps props) {

        Duration expiration = Duration.ofDays(21);

        Instant issuedAt = Instant.now();
        Instant expiresAt = issuedAt.plusSeconds(expiration.toSeconds());

        Algorithm algorithm;

        try {
            algorithm = Algorithm.ECDSA256(
                    (ECPrivateKey) KeyUtils.generatePrivateKey(props.privateKey()));
        } catch (InvalidKeySpecException | NoSuchAlgorithmException e){
            throw new RuntimeException(e);
        }

        return JWT.create()
                .withKeyId(props.keyId())
                .withIssuer(props.teamId())
                .withSubject(props.clientId())
                .withAudience("https://appleid.apple.com")
                .withIssuedAt(issuedAt)
                .withExpiresAt(expiresAt)
                .sign(algorithm);
    }

    @Override
    public String renewAccessToken() {
        return null;
    }
}
