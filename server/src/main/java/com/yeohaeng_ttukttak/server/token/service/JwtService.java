package com.yeohaeng_ttukttak.server.token.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.oauth2.repository.OAuthSessionRepository;
import com.yeohaeng_ttukttak.server.token.domain.RefreshToken;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.provider.JwtClaim;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import com.yeohaeng_ttukttak.server.token.repository.RefreshTokenRepository;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenResult;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class JwtService {

    private final JwtProvidable jwtProvider;
    private final JwtProperties jwtProps;

    private final RefreshTokenRepository refreshTokenRepository;

    public IssueAuthTokensResult issueAuthTokens(IssueAuthTokensCommand command) {

        Map<String, Object> claims = Map.of("sub", command.uuid());

        String accessToken = jwtProvider.issueByHS256(
                jwtProps.accessToken().expiration(), claims);

        Duration expiration = jwtProps.refreshToken().expiration();
        LocalDateTime expiresAt = LocalDateTime.now()
                .plusSeconds(expiration.toSeconds());

        return new IssueAuthTokensResult(accessToken, command.uuid(), expiresAt);

    }

    public DecodeAuthTokenResult decodeAuthToken(DecodeAuthTokenCommand command) {

        Map<String, JwtClaim> claims = jwtProvider.verifyByHS256(command.token());
        String sub = claims.get("sub").asString();

        return new DecodeAuthTokenResult(sub);

    }

}
