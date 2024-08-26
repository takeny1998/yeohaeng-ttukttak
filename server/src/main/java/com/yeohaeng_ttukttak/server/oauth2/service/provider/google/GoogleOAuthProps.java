package com.yeohaeng_ttukttak.server.oauth2.service.provider.google;

import jakarta.validation.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

@Validated
@ConfigurationProperties(prefix = "oauth.google")
public record GoogleOAuthProps(
        @NotBlank String clientId,
        @NotBlank String clientSecret,
        @NotBlank String redirectUri,
        @NotBlank String grantType,
        @NotBlank String scope
) { }
