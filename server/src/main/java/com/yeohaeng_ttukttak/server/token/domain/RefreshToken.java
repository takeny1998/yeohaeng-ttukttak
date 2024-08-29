package com.yeohaeng_ttukttak.server.token.domain;

import com.yeohaeng_ttukttak.server.common.entity.TimeAuditableEntity;
import com.yeohaeng_ttukttak.server.token.exception.JwtAlreadyExpiredException;
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
@NoArgsConstructor(access = PROTECTED)
@ToString(of = {"id", "deviceId", "deviceName", "expiresAt", "userId"})
public class RefreshToken extends TimeAuditableEntity {

    @Id @GeneratedValue
    private UUID id;

    private String deviceId;

    private String deviceName;

    private LocalDateTime expiresAt;

    private LocalDateTime expiredAt;

    private String userId;

    public RefreshToken(LocalDateTime expiresAt, String userId, String deviceId, String deviceName) {
        this.deviceId = deviceId;
        this.deviceName = deviceName;
        this.expiresAt = expiresAt;
        this.userId = userId;
    }

    public void expire() {
        if (Objects.nonNull(expiredAt)) {
            throw new JwtAlreadyExpiredException();
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
}
