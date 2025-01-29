package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelParticipant extends BaseTimeEntity {

    @Id @GeneratedValue
    private Long id;

    @NotNull
    @Column(updatable = false, unique = true)
    private String uuid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invitee_id")
    private Member invitee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inviter_id")
    private Member inviter;

    public TravelParticipant(
            final TravelParticipantToken participantToken, final Member invitee) {

        final Travel travel = participantToken.getTravel();

        final boolean isParticipant = travel.participants().stream()
                .anyMatch(participant -> participant.getInvitee().equals(invitee));

        final boolean isCreator = Objects.equals(invitee, travel.createdBy());

        if (isParticipant || isCreator) {
            throw ExceptionCode.TRAVEL_ALREADY_JOINED_FAIL.wrap();
        }

        this.invitee = invitee;
        this.inviter = participantToken.getInviter();
        this.uuid = participantToken.getUuid();
        this.travel = travel;
    }

}
