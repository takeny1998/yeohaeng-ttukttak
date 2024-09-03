package com.yeohaeng_ttukttak.server.token.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.token.domain.RefreshToken;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.provider.JwtClaim;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import com.yeohaeng_ttukttak.server.token.repository.RefreshTokenRepository;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenResult;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenResult;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class JwtService {

    private final JwtProvidable jwtProvider;
    private final JwtProperties jwtProps;

    private final RefreshTokenRepository refreshTokenRepository;

    public IssueAuthTokensResult issueAuthTokens(IssueAuthTokensCommand command) {

        String accessToken = issueAccessToken(command.userId());

        String refreshToken = issueRefreshToken(
                command.userId(), command.deviceId(), command.deviceName())
                .id().toString();

        return new IssueAuthTokensResult(accessToken, refreshToken,
                jwtProps.accessToken().expiration().getSeconds());

    }

    @Transactional
    public RenewTokenResult renew(RenewTokenCommand command) {

        final String deviceName = command.deviceName();
        final String deviceId = command.deviceId();

        final UUID tokenId = UUID.fromString(command.refreshToken());
        final RefreshToken refreshToken = refreshTokenRepository.findById(tokenId)
                .orElseThrow(AuthorizeFailedException::new);

        log.debug("command={}", command);
        log.debug("existToken={}", refreshToken);

        final boolean isDeviceMatched = Objects.equals(refreshToken.deviceId(), deviceId);

        if (!isDeviceMatched) {
            // TODO: 리프레시 토큰이 탈취된 것, 추가 동작을 수행한다.
            throw new AuthorizeFailedException();
        }

        final boolean isExpired = refreshToken.expiresAt().isBefore(LocalDateTime.now());

        if (isExpired) {
            throw new AuthorizationExpiredException();
        }

        final String userId = refreshToken.userId();

        return new RenewTokenResult(
                issueAccessToken(userId),
                issueRefreshToken(userId, deviceId, deviceName).id().toString(),
                jwtProps.accessToken().expiration().getSeconds()
        );

    }
    public DecodeAuthTokenResult decodeAuthToken(DecodeAuthTokenCommand command) {

        Map<String, JwtClaim> claims = jwtProvider.verifyByHS256(command.token());
        String sub = claims.get("sub").asString();

        return new DecodeAuthTokenResult(sub);

    }


    private String issueAccessToken(String userId) {

        Map<String, Object> claims = Map.of("sub", userId);

        Duration expiration = jwtProps.accessToken().expiration();

        return jwtProvider.issueByHS256(expiration, claims);

    }

    private RefreshToken issueRefreshToken(String userId, String deviceId, String deviceName) {

        Duration expiration = jwtProps.refreshToken().expiration();
        LocalDateTime expiresAt = LocalDateTime.now()
                .plusSeconds(expiration.toSeconds());

        RefreshToken refreshToken =
                new RefreshToken(expiresAt, userId, deviceId, deviceName);

        refreshTokenRepository.save(refreshToken);

        return refreshToken;

    }
}
