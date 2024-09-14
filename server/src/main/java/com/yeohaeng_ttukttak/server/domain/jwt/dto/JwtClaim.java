package com.yeohaeng_ttukttak.server.domain.jwt.dto;

import java.time.Instant;

public interface JwtClaim {

    String asString();

    Integer asInteger();

    Instant asInstant();

}
