package com.yeohaeng_ttukttak.server.user.service.token;

import com.yeohaeng_ttukttak.server.user.service.client.property.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.user.service.token.dto.IdTokenClaim;

public interface TokenService {

    String issueAccessToken(String openId);

    String issueRefreshToken(String openId);

    String renewAccessToken();

    IdTokenClaim decodeIdToken(String idToken);

    String generateClientSecret(AppleOAuthProps props);

}
