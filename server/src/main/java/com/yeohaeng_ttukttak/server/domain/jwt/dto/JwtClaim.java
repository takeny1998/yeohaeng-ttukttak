package com.yeohaeng_ttukttak.server.domain.jwt.dto;

import java.time.Instant;
import java.util.Map;

public abstract class JwtClaim {

    public abstract String asString();

    public abstract Integer asInteger();

    public abstract Instant asInstant();

    public static JwtClaim of(Map<String, JwtClaim> claims, String key) {
        if (!claims.containsKey(key)) {
            return new NullJwtClaim();
        }
        return claims.get(key);
    }

}
