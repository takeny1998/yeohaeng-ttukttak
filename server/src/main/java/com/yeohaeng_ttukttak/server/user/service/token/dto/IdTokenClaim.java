package com.yeohaeng_ttukttak.server.user.service.token.dto;

public record IdTokenClaim(
        String openId,
        String name
) { }
