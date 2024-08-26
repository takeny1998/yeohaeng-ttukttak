package com.yeohaeng_ttukttak.server.token.service;

import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenResult;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class JwtService {

    private final JwtProvidable jwtProvider;
    private final JwtProperties jwtProps;

    public IssueAuthTokensResult issueAuthTokens(IssueAuthTokensCommand command) {

        Map<String, Object> claims = Map.of("sub", command.uuid());

        String accessToken = jwtProvider.issueByHS256(
                jwtProps.accessToken().expiration(), claims);

        String refreshToken = jwtProvider.issueByHS256(
                jwtProps.refreshToken().expiration(), claims);

        return new IssueAuthTokensResult(accessToken, refreshToken);

    }

    public DecodeAuthTokenResult decodeAuthToken(DecodeAuthTokenCommand command) {

        Map<String, Object> claims = jwtProvider.decode(command.token());
        String sub = String.valueOf(claims.get("sub"))
                .replace("\"", "");

        return new DecodeAuthTokenResult(sub);

    }

}
