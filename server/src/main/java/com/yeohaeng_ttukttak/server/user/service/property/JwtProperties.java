package com.yeohaeng_ttukttak.server.user.service.property;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import java.time.Duration;

@Validated
@ConfigurationProperties(prefix = "jwt")
public record JwtProperties(
        @NotBlank String issuer,
        @NotBlank String secret,
        TokenProperties accessToken,
        TokenProperties refreshToken) {


    public record TokenProperties(
            @NotNull Duration expiration
    ) {}

}
