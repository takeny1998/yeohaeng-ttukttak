package com.yeohaeng_ttukttak.server.common.util.my_jwt;


import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.HashMap;
import java.util.Map;

import static lombok.AccessLevel.PRIVATE;

@RequiredArgsConstructor(access = PRIVATE)
public class MyJwtClaimBuilder {

    private final Map<String, Object> claims = new HashMap<>();

    private String issuer = "yeohaeng-ttukttak.com";
    private LocalDateTime issuedAt = LocalDateTime.now();
    private final LocalDateTime expiredAt;

    public static MyJwtClaimBuilder create(LocalDateTime expiredAt) {
        return new MyJwtClaimBuilder(expiredAt);
    }

    public MyJwtClaimBuilder addClaim(String key, Object value) {
        claims.put(key, value);
        return this;
    }

    public MyJwtClaimBuilder issuer(String issuer) {
        this.issuer = issuer;
        return this;
    }

    public MyJwtClaimBuilder issuedAt(LocalDateTime issuedAt) {
        this.issuedAt = issuedAt;
        return this;
    }

    public Map<String, Object> build() {
        claims.put("iat", issuedAt.toEpochSecond(ZoneOffset.UTC));
        claims.put("exp", expiredAt.toEpochSecond(ZoneOffset.UTC));
        claims.put("iss", issuer);
        return claims;
    }
}