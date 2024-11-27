package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.Id;
import org.springframework.data.redis.core.RedisHash;

import java.util.UUID;

@RedisHash(value = "invite", timeToLive = 300L)
public class TravelInvitation {

    @Id
    private String id;

    private Long travelId;

    private String memberId;

    public TravelInvitation(String memberId, Long travelId) {
        this.id = UUID.randomUUID().toString();
        this.travelId = travelId;
        this.memberId = memberId;
    }

    public String id() {
        return id;
    }

    public String memberId() {
        return memberId;
    }

    public Long travelId() {
        return travelId;
    }

}
