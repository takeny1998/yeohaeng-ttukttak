package com.yeohaeng_ttukttak.server.token;

import java.time.Duration;
import java.util.Map;

public interface TokenService {

    String issueByHS256(Duration expiration, Map<String, Object> claims);

    String issueByES256(
            String privateKey, Duration expiration,
            Map<String, Object> headers, Map<String, Object> claims);

    Map<String, Object> decode(String token);

}
