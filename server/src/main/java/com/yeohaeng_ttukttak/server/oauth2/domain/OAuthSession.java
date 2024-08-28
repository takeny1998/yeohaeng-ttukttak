package com.yeohaeng_ttukttak.server.oauth2.domain;

import com.yeohaeng_ttukttak.server.common.entity.TimeAuditableEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.UUID;

import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@ToString(of = {"id", "deviceId", "deviceName", "refreshToken", "userId"})
public class OAuthSession extends TimeAuditableEntity {

    @Id @GeneratedValue
    private UUID id;

    private String deviceId;

    private String deviceName;

    private String refreshToken;

    private LocalDateTime expiresAt;

    private String userId;

    public OAuthSession(String deviceId, String deviceName) {
        this.deviceId = deviceId;
        this.deviceName = deviceName;
    }

    public void setRefreshToken(String refreshToken, LocalDateTime expiresAt) {
        this.refreshToken = refreshToken;
        this.expiresAt = expiresAt;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public String refreshToken() {
        return refreshToken;
    }

    public LocalDateTime expiresAt() {
        return expiresAt;
    }

    public String userId() {
        return userId;
    }
}
