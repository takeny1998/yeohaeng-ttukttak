package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple;

import com.yeohaeng_ttukttak.server.oauth2.service.provider.OAuthProvidable;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.client.AppleOAuthClient;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.token.provider.JwtClaim;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.Optional;

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

        final String clientSecret = clientSecretProvider.clientSecret();

        final ExchangeTokenResponse response = oauthClient.exchangeToken(
                command.code(),
                oauthProps.clientId(),
                clientSecret,
                "authorization_code");

        log.debug("accessToken={}", response);

        final Map<String, JwtClaim> claims = jwtProvidable.decode(response.idToken());

        log.debug("claims={}", claims);

        final String openId = Optional.ofNullable(claims.get("sub"))
                .map(JwtClaim::asString)
                .orElseGet(() -> null);

        final String email = Optional.ofNullable(claims.get("email"))
                .map(JwtClaim::asString)
                .orElseGet(() -> null);

        final String accessToken = response.accessToken();

        return new GetIdResult(openId, null, email, accessToken);

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
                command.accessToken(), oauthProps.clientId(), clientSecret);

    }
}
