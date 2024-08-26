package com.yeohaeng_ttukttak.server.token.service;

import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class JwtService {

    private final JwtProvidable jwtProvider;
    private final JwtProperties jwtProps;

    public IssueAuthTokensResult issueAuthTokens(IssueAuthTokensCommand command) {

        Map<String, Object> claims = Map.of("sub", command.openId());

        String accessToken = jwtProvider.issueByHS256(
                jwtProps.accessToken().expiration(), claims);

        String refreshToken = jwtProvider.issueByHS256(
                jwtProps.refreshToken().expiration(), claims);

        return new IssueAuthTokensResult(accessToken, refreshToken);

    }

}
