package com.yeohaeng_ttukttak.server.domain.travel.role;

import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Role;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import lombok.RequiredArgsConstructor;

import java.util.List;

@RequiredArgsConstructor
public class TravelParticipantRole implements Role {

    private final List<String> participantIdList;

    public TravelParticipantRole(final Travel travel) {
        this.participantIdList = travel.participants()
                .stream()
                .map(TravelParticipant::invitee)
                .map(Member::uuid)
                .toList();
    }

    @Override
    public boolean checkGrantable(String memberId) {
        return participantIdList
                .stream().anyMatch(uuid -> uuid.equals(memberId));
    }

}
