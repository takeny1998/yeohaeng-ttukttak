package com.yeohaeng_ttukttak.server.domain.oauth.service;

import com.yeohaeng_ttukttak.server.domain.oauth.dto.ProfileDto;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuthProvider;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleOAuthProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleProfileResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
public class GoogleOAuthService implements OAuthService {

    private final GoogleOAuthClient oauthClient;
    private final GoogleProfileClient profileClient;

    private final GoogleOAuthProperties properties;

    @Override
    public TokenDto getToken(String authorizationCode) {
        return oauthClient.getToken(
                authorizationCode,
                properties.clientId(),
                properties.clientSecret());
    }

    @Override
    public ProfileDto getProfile(String accessToken) {
        GoogleProfileResponse response = profileClient.getProfile("Bearer " + accessToken);
        log.debug("[GoogleOAuthService.getProfile] profileResponse = {}", response);

        return new ProfileDto(response.birthday(), response.gender(), response.nickname());
    }

    @Override
    public OAuthProvider getProvider() {
        return OAuthProvider.GOOGLE;
    }
}
