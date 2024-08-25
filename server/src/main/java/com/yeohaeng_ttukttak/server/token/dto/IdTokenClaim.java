package com.yeohaeng_ttukttak.server.token.dto;

public record IdTokenClaim(
        String openId,
        String name
) { }
