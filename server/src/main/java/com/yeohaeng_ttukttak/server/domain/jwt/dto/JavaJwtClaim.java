package com.yeohaeng_ttukttak.server.domain.jwt.dto;

import com.auth0.jwt.interfaces.Claim;
import lombok.RequiredArgsConstructor;

import java.time.Instant;
import java.util.Map;

@RequiredArgsConstructor
public final class JavaJwtClaim extends JwtClaim {

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
