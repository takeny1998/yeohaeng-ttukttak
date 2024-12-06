package com.yeohaeng_ttukttak.server.domain.oauth.service;

import com.yeohaeng_ttukttak.server.domain.oauth.apple.AppleOAuthClient;
import com.yeohaeng_ttukttak.server.domain.oauth.apple.AppleOAuthProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.ProfileDto;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuthProvider;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class AppleOAuthService implements OAuthService {

    private final AppleOAuthClient client;
    private final AppleOAuthProperties properties;

    @Override
    public TokenDto getToken(String authorizationCode) {
        return client.getToken(
                authorizationCode,
                properties.clientId(),
                properties.clientSecret());
    }

    @Override
    public ProfileDto getProfile(String accessToken) {
        return new ProfileDto(null, null, null);
    }

    @Override
    public OAuthProvider getProvider() {
        return OAuthProvider.APPLE;
    }

}
