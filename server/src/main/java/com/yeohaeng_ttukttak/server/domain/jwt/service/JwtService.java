package com.yeohaeng_ttukttak.server.domain.jwt.service;

import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;

import java.time.Duration;
import java.util.Map;

public interface JwtService {

    String issueByHS256(String secret, String issuer, Duration expiration, Map<String, Object> claims);

    String issueByES256(
            String privateKey, Duration expiration,
            Map<String, Object> headers, Map<String, Object> claims);

    Map<String, JwtClaim> decode(String jwtToken);

    Map<String, JwtClaim> verifyByHS256(String jwtToken);

    Map<String, JwtClaim> verifyByRSA256(String jwtToken);

}
