package com.yeohaeng_ttukttak.server.token;

import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.token.dto.IdTokenClaim;

public interface TokenService {

    String issueAccessToken(String openId);

    String issueRefreshToken(String openId);

    String renewAccessToken();

    IdTokenClaim decodeIdToken(String idToken);

    String generateClientSecret(AppleOAuthProps props);

}
