package com.yeohaeng_ttukttak.server.domain.travel.role;

import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Role;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import lombok.RequiredArgsConstructor;

import java.util.Optional;

@RequiredArgsConstructor
public class TravelParticipantInviteeRole implements Role {

    private final TravelParticipant participant;

    @Override
    public boolean checkGrantable(final String memberId) {

        return Optional.ofNullable(participant.getInvitee())
                .map(Member::uuid)
                .map(uuid -> uuid.equals(memberId))
                .orElse(false);

    }
}
