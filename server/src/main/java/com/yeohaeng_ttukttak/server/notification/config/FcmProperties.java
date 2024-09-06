package com.yeohaeng_ttukttak.server.notification.config;


import jakarta.validation.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "fcm")
public record FcmProperties(@NotBlank String secretKey) { }