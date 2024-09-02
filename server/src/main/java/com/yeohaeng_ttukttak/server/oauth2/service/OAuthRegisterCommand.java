package com.yeohaeng_ttukttak.server.oauth2.service;

public record OAuthRegisterCommand(
    String code,
    String deviceId,
    String deviceName
) { }
