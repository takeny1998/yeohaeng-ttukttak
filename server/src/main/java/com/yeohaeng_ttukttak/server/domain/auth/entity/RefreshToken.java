package com.yeohaeng_ttukttak.server.domain.auth.entity;

import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.TimeToLive;
import org.springframework.data.redis.core.index.Indexed;

import java.time.LocalDateTime;

@RedisHash(value = "refresh-token")
@ToString
public class RefreshToken {

    @Id
    private String refreshToken;

    @Indexed
    private String memberId;

    private LocalDateTime expiredAt;

    @TimeToLive
    private Long expirationSeconds;

    public RefreshToken(String refreshToken, String memberId, Long expirationSeconds) {
        this.refreshToken = refreshToken;
        this.memberId = memberId;
        this.expirationSeconds = expirationSeconds;
    }

    public LocalDateTime expiredAt() {
        return expiredAt;
    }

    public void setExpiredAt(LocalDateTime expiredAt) {
        this.expiredAt = expiredAt;
    }

    public String memberId() {
        return memberId;
    }
}
