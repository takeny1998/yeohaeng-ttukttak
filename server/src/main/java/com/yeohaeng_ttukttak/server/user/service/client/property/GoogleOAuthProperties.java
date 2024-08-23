package com.yeohaeng_ttukttak.server.user.service.client.property;

import jakarta.validation.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

@Validated
@ConfigurationProperties(prefix = "oauth.google")
public record GoogleOAuthProperties(
        @NotBlank String domain,
        @NotBlank String clientId,
        @NotBlank String clientSecret,
        @NotBlank String redirectUri,
        @NotBlank String grantType,
        @NotBlank String scope
) {}
