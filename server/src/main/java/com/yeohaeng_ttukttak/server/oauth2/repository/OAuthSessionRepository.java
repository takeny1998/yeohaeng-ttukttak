package com.yeohaeng_ttukttak.server.oauth2.repository;

import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthSession;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface OAuthSessionRepository extends JpaRepository<OAuthSession, UUID> {

    Optional<OAuthSession> findByRefreshToken(String refreshToken);

}
