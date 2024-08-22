package com.yeohaeng_ttukttak.server.user.service.token;

public interface TokenService {

    String issueAccessToken(String openId);

    String issueRefreshToken(String openId);

    String renewAccessToken();

    String decodeIdToken(String idToken);

}
