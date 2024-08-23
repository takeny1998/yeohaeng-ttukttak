package com.yeohaeng_ttukttak.server.user.service;

import com.yeohaeng_ttukttak.server.user.domain.auth.OAuthProvider;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.user.service.client.dto.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.service.client.dto.RevokeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.property.GoogleOAuthProps;
import com.yeohaeng_ttukttak.server.user.service.dto.GetIdentificationCommand;
import com.yeohaeng_ttukttak.server.user.service.dto.Identification;
import com.yeohaeng_ttukttak.server.user.service.dto.Profile;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import com.yeohaeng_ttukttak.server.user.service.token.dto.IdTokenClaim;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Slf4j
@Component
@RequiredArgsConstructor
public class GoogleOAuthProvider implements OAuthProvidable {

    private final GoogleOAuthProps oauthProps;
    private final GoogleOAuthClient googleOAuthClient;
    private final GoogleProfileClient googleProfileClient;
    private final TokenService tokenService;

    @Override
    public Identification getIdentification(GetIdentificationCommand command) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(oauthProps, command.code()));

        log.debug("identification={}", tokenResponse);

        IdTokenClaim idTokenClaim = tokenService.decodeIdToken(tokenResponse.idToken());

        String openId = idTokenClaim.openId();
        String name = idTokenClaim.name();
        String token = tokenResponse.accessToken();

        return new Identification(openId, name, token);

    }

    @Override
    public OAuthProvider getProvider() {
        return OAuthProvider.GOOGLE;
    }

    @Override
    public void revoke(Identification id) {

        googleOAuthClient.revokeToken(new RevokeTokenRequest(id.token()));

    }

    @Override
    public Profile getProfile() {

        GetProfileResponse profileResponse =
                googleProfileClient.getProfile();

        log.debug("profile={}", profileResponse);

        return new Profile(
                profileResponse.gender(), profileResponse.birthday());

    }

}
