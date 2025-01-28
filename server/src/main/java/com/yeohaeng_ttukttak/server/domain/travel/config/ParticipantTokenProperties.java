package com.yeohaeng_ttukttak.server.domain.travel.config;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.time.Duration;

@ConfigurationProperties(prefix = "participant-token")
public record ParticipantTokenProperties(
        @NotEmpty String issuer,
        @NotNull Duration expiration,
        @NotEmpty String secret) { }