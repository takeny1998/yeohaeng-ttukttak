package com.yeohaeng_ttukttak.server.token.repository;

import com.yeohaeng_ttukttak.server.token.domain.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> {

    Optional<RefreshToken> findByUserId(String userId);

    List<RefreshToken> findAllByUserId(String userId);
}
