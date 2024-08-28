package com.yeohaeng_ttukttak.server.token.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizationExpiredException;
import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.AuthorizeFailedException;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthSession;
import com.yeohaeng_ttukttak.server.oauth2.repository.OAuthSessionRepository;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.RenewTokenResult;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.issue_auth_token.IssueAuthTokensResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Objects;

@Slf4j
@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class TokenService {

    private final OAuthSessionRepository sessionRepository;
    private final JwtService jwtService;

    @Transactional
    public RenewTokenResult renew(RenewTokenCommand command) {

        String refreshToken = command.refreshToken();
        String deviceId = command.deviceId();

        log.debug("refreshToken={}", refreshToken);
        log.debug("sessions={}", sessionRepository.findAll());

        OAuthSession session = sessionRepository
                .findByRefreshToken(refreshToken)
                .orElseThrow(AuthorizeFailedException::new);

        if (!Objects.equals(session.deviceId(), deviceId)) {
            // TODO: 리프레시 토큰이 탈취된 것, 추가 동작을 수행한다.
            sessionRepository.delete(session);
            throw new AuthorizeFailedException();
        }

        if (session.expiresAt().isBefore(LocalDateTime.now())) {
            sessionRepository.delete(session);
            throw new AuthorizationExpiredException();
        }

        // TODO: User ID에 대해서 검증 코드를 추가한다.

        IssueAuthTokensResult result = jwtService.issueAuthTokens(
                new IssueAuthTokensCommand(session.userId()));

        session.setRefreshToken(result.refreshToken(), result.expiresAt());
        sessionRepository.save(session);

        return new RenewTokenResult(result.accessToken(), result.refreshToken());

    }
}
