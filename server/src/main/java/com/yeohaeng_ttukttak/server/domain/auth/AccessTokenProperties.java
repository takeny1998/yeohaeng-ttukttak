package com.yeohaeng_ttukttak.server.domain.auth;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.time.Duration;

@ConfigurationProperties("auth.access-token")
public record AccessTokenProperties(
        @NotBlank String issuer,
        @NotBlank String secret,
        @NotNull Duration expiration
){ }
