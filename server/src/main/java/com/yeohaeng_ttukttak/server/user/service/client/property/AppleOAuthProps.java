package com.yeohaeng_ttukttak.server.user.service.client.property;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Slf4j
@ConfigurationProperties(prefix = "oauth.apple")
public record AppleOAuthProps(
        String keyId,
        String clientId,
        String teamId,
        String redirectUri,
        String privateKey
) {}