package com.yeohaeng_ttukttak.server.domain.oauth.service;

import com.yeohaeng_ttukttak.server.domain.oauth.dto.ProfileDto;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuthProvider;

public interface OAuthService {

    TokenDto getToken(String authorizationCode);

    ProfileDto getProfile(String accessToken);

    OAuthProvider getProvider();

}
