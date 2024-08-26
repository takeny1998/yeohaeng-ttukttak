package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple;

import com.yeohaeng_ttukttak.server.oauth2.service.OAuthProvidable;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.client.AppleOAuthClient;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class AppleOAuthProvider implements OAuthProvidable {

    private final AppleClientSecretProvider clientSecretProvider;
    private final AppleOAuthClient oauthClient;
    private final AppleOAuthProps oauthProps;

    private final JwtProvidable jwtProvidable;

    @Override
    public GetIdResult getIdentification(GetIdCommand command) {

        String clientSecret = clientSecretProvider.clientSecret();
        String redirectUri =
                oauthProps.redirectUri() + "/" + command.action();

        ExchangeTokenResponse response = oauthClient.exchangeToken(
                command.code(),
                oauthProps.clientId(),
                clientSecret,
                "authorization_code",
                redirectUri);

        log.debug("token={}", response);
        Map<String, Object> claims = jwtProvidable.decode(response.idToken());

        String openId = claims.get("sub").toString();

        return new GetIdResult(openId, null, response.accessToken());

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
