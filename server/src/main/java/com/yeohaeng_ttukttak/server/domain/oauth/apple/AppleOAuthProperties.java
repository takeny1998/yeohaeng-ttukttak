package com.yeohaeng_ttukttak.server.domain.oauth.apple;

import jakarta.validation.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "oauth.apple")
public record AppleOAuthProperties (
        @NotBlank String clientId,
        @NotBlank String clientSecret
){ }
