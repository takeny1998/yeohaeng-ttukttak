package com.yeohaeng_ttukttak.server.domain.oauth.google;

import jakarta.validation.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "oauth.google")
public record GoogleOAuthProperties(
        @NotBlank String clientId,
        @NotBlank String clientSecret
){ }
