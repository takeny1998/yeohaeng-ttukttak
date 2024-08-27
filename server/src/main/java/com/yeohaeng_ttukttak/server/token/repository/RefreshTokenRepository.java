package com.yeohaeng_ttukttak.server.token.repository;

import com.yeohaeng_ttukttak.server.token.domain.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> { }
