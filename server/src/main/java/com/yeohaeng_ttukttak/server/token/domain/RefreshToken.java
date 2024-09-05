package com.yeohaeng_ttukttak.server.token.domain;

import com.yeohaeng_ttukttak.server.common.entity.TimeAuditableEntity;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidAuthorizationException;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
@NoArgsConstructor(access = PROTECTED)
public class RefreshToken extends TimeAuditableEntity {

    @Id @GeneratedValue
    private UUID id;

    private String deviceId;

    private String deviceName;

    private String notificationToken;

    private LocalDateTime expiresAt;

    private LocalDateTime expiredAt;

    private String userId;

    public RefreshToken(String userId, String deviceId, String deviceName, String notificationToken, LocalDateTime expiresAt) {
        this.userId = userId;
        this.deviceId = deviceId;
        this.deviceName = deviceName;
        this.notificationToken = notificationToken;
        this.expiresAt = expiresAt;
    }

    public void expire() {
        if (Objects.nonNull(expiredAt)) {
            throw new InvalidAuthorizationException();
        }

        this.expiredAt = LocalDateTime.now();
    }

    public UUID id() {
        return id;
    }

    public String deviceId() {
        return deviceId;
    }

    public String deviceName() {
        return deviceName;
    }

    public LocalDateTime expiresAt() {
        return expiresAt;
    }

    public String userId() {
        return userId;
    }

    public String notificationToken() {
        return notificationToken;
    }

    public boolean isExpired() {
        return Objects.nonNull(expiredAt);
    }
}
