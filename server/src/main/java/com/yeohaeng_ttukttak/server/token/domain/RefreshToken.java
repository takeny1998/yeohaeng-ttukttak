package com.yeohaeng_ttukttak.server.token.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
public class RefreshToken {

    @Id @GeneratedValue
    private UUID id;

    private String userId;

    private LocalDateTime expiresAt;

    public RefreshToken(String userId, LocalDateTime expiresAt) {
        this.userId = userId;
        this.expiresAt = expiresAt;
    }

    public String value() {
        return id.toString();
    }

    public String userId() {
        return userId;
    }

    public LocalDateTime expiresAt() {
        return expiresAt;
    }
}
