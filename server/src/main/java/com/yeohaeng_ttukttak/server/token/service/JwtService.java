package com.yeohaeng_ttukttak.server.token.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidAuthorizationException;
import com.yeohaeng_ttukttak.server.notification.dto.SendAllCommand;
import com.yeohaeng_ttukttak.server.notification.service.NotificationService;
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
import java.util.List;
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

    private final NotificationService notificationService;

    public IssueAuthTokensResult issueAuthTokens(IssueAuthTokensCommand command) {

        final String userId = command.userId();
        final String deviceId = command.deviceId();
        final String deviceName = command.deviceName();

        final String accessToken = issueAccessToken(userId);

        notifySignIn(userId, deviceName);

        RefreshToken refreshToken = issueRefreshToken(
                userId, deviceId, deviceName, command.notificationToken());

        return new IssueAuthTokensResult(accessToken, refreshToken.id().toString(),
                jwtProps.accessToken().expiration().getSeconds());

    }

    @Transactional
    public RenewTokenResult renew(RenewTokenCommand command) {

        final String deviceName = command.deviceName();
        final String deviceId = command.deviceId();

        final UUID tokenId = UUID.fromString(command.refreshToken());


        final RefreshToken existToken = refreshTokenRepository.findById(tokenId)
                .orElseThrow(InvalidAuthorizationException::new);

        log.debug("command={}", command);
        log.debug("existToken={}", existToken);

        final String notificationToken = existToken.notificationToken();
        final String userId = existToken.userId();

        validateDeviceMatched(deviceId, existToken);

        validate(existToken);

        return new RenewTokenResult(
                issueAccessToken(userId),
                issueRefreshToken(userId, deviceId, deviceName, notificationToken).id().toString(),
                jwtProps.accessToken().expiration().getSeconds()
        );

    }

    @Transactional
    public void deleteAuthToken(String refreshToken, String deviceId) {

        UUID id = UUID.fromString(refreshToken);

        RefreshToken existToken = refreshTokenRepository.findById(id)
                .orElseThrow(InvalidAuthorizationException::new);

        validateDeviceMatched(deviceId, existToken);

        if (existToken.isExpired()) return;
        existToken.expire();

    }

    private void validateDeviceMatched(String deviceId, RefreshToken existToken) {
        final boolean isDeviceMatched = Objects.equals(existToken.deviceId(), deviceId);

        if (!isDeviceMatched) {
            // TODO: 리프레시 토큰이 탈취된 것, 추가 동작을 수행한다.
            throw new InvalidAuthorizationException();
        }
    }

    private void validate(RefreshToken refreshToken) {

        final boolean isExpired = refreshToken.expiresAt()
                .isBefore(LocalDateTime.now());

        if (isExpired) {
            throw new AuthorizationExpiredException();
        }
    }

    public DecodeAuthTokenResult decodeAuthToken(DecodeAuthTokenCommand command) {

        Map<String, JwtClaim> claims = jwtProvider.verifyByHS256(command.token());
        String sub = claims.get("sub").asString();

        return new DecodeAuthTokenResult(sub);

    }

    private void notifySignIn(String userId, String deviceName) {

        final List<RefreshToken> existTokens = refreshTokenRepository.findAllByUserId(userId);

        final List<String> targets = existTokens.stream()
                .filter(refreshToken -> !refreshToken.isExpired())
                .map(RefreshToken::notificationToken)
                .toList();

        if (targets.isEmpty()) return;

        Map<String, String> data = Map.of(
                "code", "ALERT_SIGN_IN",
                "device_name", deviceName,
                "signed_in_at", LocalDateTime.now().toString());

        notificationService.sendAll(new SendAllCommand(targets, "새로운 로그인", "다른 기기에서 로그인을 시도했습니다.", data));

    }

    private String issueAccessToken(String userId) {

        Map<String, Object> claims = Map.of("sub", userId);

        Duration expiration = jwtProps.accessToken().expiration();

        return jwtProvider.issueByHS256(expiration, claims);

    }

    private RefreshToken issueRefreshToken(String userId, String deviceId, String deviceName, String notificationToken) {

        Duration expiration = jwtProps.refreshToken().expiration();
        LocalDateTime expiresAt = LocalDateTime.now()
                .plusSeconds(expiration.toSeconds());

        RefreshToken refreshToken = new RefreshToken(userId, deviceId, deviceName, notificationToken, expiresAt);

        refreshTokenRepository.save(refreshToken);

        return refreshToken;

    }
}
