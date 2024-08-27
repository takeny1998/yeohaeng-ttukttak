package com.yeohaeng_ttukttak.server.token.provider;

import java.time.Duration;
import java.util.Map;

public interface JwtProvidable {

    String issueByHS256(Duration expiration, Map<String, Object> claims);

    String issueByES256(
            String privateKey, Duration expiration,
            Map<String, Object> headers, Map<String, Object> claims);

    Map<String, Object> decode(String token);

    Map<String, JwtClaim> verifyByHS256(String token);

}
