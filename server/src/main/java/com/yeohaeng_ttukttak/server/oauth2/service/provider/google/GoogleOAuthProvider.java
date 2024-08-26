package com.yeohaeng_ttukttak.server.oauth2.service.provider.google;

import com.yeohaeng_ttukttak.server.oauth2.service.OAuthProvidable;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenRequest;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.get_profile.GetProfileResponse;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.revoke_token.RevokeTokenRequest;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class GoogleOAuthProvider implements OAuthProvidable {

    private final GoogleOAuthProps oauthProps;
    private final GoogleOAuthClient googleOAuthClient;
    private final GoogleProfileClient googleProfileClient;
    private final JwtProvidable jwtProvidable;

    @Override
    public GetIdResult getIdentification(GetIdCommand command) {

        ExchangeTokenResponse tokenResponse = googleOAuthClient.exchangeToken(
                new ExchangeTokenRequest(oauthProps, command.code()));

        log.debug("identification={}", tokenResponse);

        Map<String, Object> claims = jwtProvidable.decode(tokenResponse.idToken());

        String openId = claims.get("sub").toString();
        String name = claims.get("name").toString();

        String token = tokenResponse.accessToken();

        return new GetIdResult(openId, name, token);

    }

    @Override
    public OAuthProvider getProvider() {
        return OAuthProvider.GOOGLE;
    }

    @Override
    public void revoke(RevokeCommand revokeCommand) {

        googleOAuthClient.revokeToken(
                new RevokeTokenRequest(revokeCommand.token()));

    }

    @Override
    public GetProfileResult getProfile() {

        GetProfileResponse profileResponse =
                googleProfileClient.getProfile();

        log.debug("profile={}", profileResponse);

        return new GetProfileResult(
                profileResponse.gender(), profileResponse.birthday());

    }

}
