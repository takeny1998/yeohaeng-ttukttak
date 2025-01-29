package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import lombok.Getter;

@Getter
public class TravelParticipantToken {

    private final String uuid;

    private final Travel travel;

    private final Member inviter;

    public TravelParticipantToken(final Travel travel, final Member inviter) {
        this(StringUtil.createShortUUID(), travel, inviter);
    }

    public TravelParticipantToken(
            final String uuid, final Travel travel, final Member inviter) {

        if (travel.participants().size() > 50) {
            throw ExceptionCode.TOO_MANY_PARTICIPANT_FAIL.wrap();
        }

        final boolean isAlreadyExist = travel.participants().stream()
                .anyMatch(participant -> participant.getUuid().equals(uuid));

        if (isAlreadyExist) {
            throw ExceptionCode.INVITATION_INVALID_OR_EXPIRED_FAIL.wrap();
        }

        this.uuid = uuid;
        this.inviter = inviter;
        this.travel = travel;
    }

}
