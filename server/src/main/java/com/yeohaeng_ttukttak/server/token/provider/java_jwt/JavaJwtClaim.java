package com.yeohaeng_ttukttak.server.token.provider.java_jwt;

import com.auth0.jwt.interfaces.Claim;
import com.yeohaeng_ttukttak.server.token.provider.JwtClaim;
import lombok.RequiredArgsConstructor;

import java.time.Instant;

@RequiredArgsConstructor
public class JavaJwtClaim implements JwtClaim {

    private final Claim claim;

    @Override
    public String asString() {
        return claim.asString();
    }

    @Override
    public Integer asInteger() {
        return claim.asInt();
    }

    @Override
    public Instant asInstant() {
        return claim.asInstant();
    }
}
