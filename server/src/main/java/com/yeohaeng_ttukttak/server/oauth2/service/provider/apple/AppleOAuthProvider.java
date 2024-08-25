package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple;

import com.yeohaeng_ttukttak.server.oauth2.service.OAuthProvidable;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.client.AppleOAuthClient;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.token.TokenService;
import com.yeohaeng_ttukttak.server.token.dto.IdTokenClaim;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class AppleOAuthProvider implements OAuthProvidable {

    private final AppleClientSecretProvider clientSecretProvider;
    private final AppleOAuthClient oauthClient;
    private final AppleOAuthProps oauthProps;

    private final TokenService tokenService;

    @Override
    public GetIdResult getIdentification(GetIdCommand command) {

        String clientSecret = clientSecretProvider.clientSecret();

        ExchangeTokenResponse response = oauthClient.exchangeToken(
                command.code(),
                oauthProps.clientId(),
                clientSecret,
                "authorization_code",
                oauthProps.redirectUri());

        log.debug("token={}", response);

        IdTokenClaim claim = tokenService.decodeIdToken(response.idToken());

        return new GetIdResult(claim.openId(), claim.name(), response.accessToken());

    }

    @Override
    public GetProfileResult getProfile() {
        return new GetProfileResult(null, null);
    }

    @Override
    public OAuthProvider getProvider() {
        return OAuthProvider.APPLE;
    }

    @Override
    public void revoke(RevokeCommand command) {

        String clientSecret = clientSecretProvider.clientSecret();

        oauthClient.revokeToken(
                command.token(), oauthProps.clientId(), clientSecret);

    }
}
