package com.yeohaeng_ttukttak.server.token.provider;

import java.time.Instant;

public interface JwtClaim {

    String asString();

    Integer asInteger();

    Instant asInstant();

}
