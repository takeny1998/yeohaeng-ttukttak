package com.yeohaeng_ttukttak.server.domain.auth;

import jakarta.validation.constraints.NotNull;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.time.Duration;

@ConfigurationProperties("auth.refresh-token")
public record RefreshTokenProperties(
        @NotNull Duration expiration
){ }
