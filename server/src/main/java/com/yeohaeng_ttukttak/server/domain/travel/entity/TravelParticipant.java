package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelParticipant {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invitee_id")
    private Member invitee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inviter_id")
    private Member inviter;

    protected TravelParticipant(Travel travel, Member invitee, Member inviter) {
        this.travel = travel;

        if (Objects.equals(invitee.uuid(), inviter.uuid())) {
            throw ExceptionCode.CANNOT_INVITE_YOURSELF_FAIL.getInstance();
        }

        this.invitee = invitee;
        this.inviter = inviter;
    }

    public Long id() {
        return id;
    }

    public Travel travel() {
        return travel;
    }

    public Member invitee() {
        return invitee;
    }

    public Member inviter() {
        return inviter;
    }
}
