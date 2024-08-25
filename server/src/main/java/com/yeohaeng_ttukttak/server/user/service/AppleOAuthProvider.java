package com.yeohaeng_ttukttak.server.user.service;

import com.yeohaeng_ttukttak.server.user.domain.auth.OAuthProvider;
import com.yeohaeng_ttukttak.server.user.service.client.AppleClientSecretProvider;
import com.yeohaeng_ttukttak.server.user.service.client.AppleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.user.service.client.property.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.user.service.dto.GetIdentificationCommand;
import com.yeohaeng_ttukttak.server.user.service.dto.Identification;
import com.yeohaeng_ttukttak.server.user.service.dto.Profile;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import com.yeohaeng_ttukttak.server.user.service.token.dto.IdTokenClaim;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class AppleOAuthProvider implements OAuthProvidable{

    private final AppleClientSecretProvider clientSecretProvider;
    private final AppleOAuthClient oauthClient;
    private final AppleOAuthProps oauthProps;

    private final TokenService tokenService;

    @Override
    public Identification getIdentification(GetIdentificationCommand command) {

        String clientSecret = clientSecretProvider.clientSecret();

        ExchangeTokenResponse response = oauthClient.exchangeToken(
                command.code(),
                oauthProps.clientId(),
                clientSecret,
                "authorization_code",
                oauthProps.redirectUri());

        log.debug("token={}", response);

        IdTokenClaim claim = tokenService.decodeIdToken(response.idToken());

        return new Identification(claim.openId(), claim.name(), response.accessToken());

    }

    @Override
    public Profile getProfile() {
        return new Profile(null, null);
    }

    @Override
    public OAuthProvider getProvider() {
        return OAuthProvider.APPLE;
    }

    @Override
    public void revoke(Identification id) {

        String clientSecret = clientSecretProvider.clientSecret();

        oauthClient.revokeToken(
                id.token(), oauthProps.clientId(), clientSecret);

    }
}
