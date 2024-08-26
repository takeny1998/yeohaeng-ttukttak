package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple;

import jakarta.validation.constraints.NotBlank;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Slf4j
@ConfigurationProperties(prefix = "oauth.apple")
public record AppleOAuthProps(
        @NotBlank String keyId,
        @NotBlank String clientId,
        @NotBlank String teamId,
        @NotBlank String redirectUri,
        @NotBlank String privateKey
) {}