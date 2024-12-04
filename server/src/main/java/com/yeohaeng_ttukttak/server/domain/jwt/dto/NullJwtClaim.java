package com.yeohaeng_ttukttak.server.domain.jwt.dto;

import java.time.Instant;

public final class NullJwtClaim extends JwtClaim {
    @Override
    public String asString() {
        return null;
    }

    @Override
    public Integer asInteger() {
        return null;
    }

    @Override
    public Instant asInstant() {
        return null;
    }
}
