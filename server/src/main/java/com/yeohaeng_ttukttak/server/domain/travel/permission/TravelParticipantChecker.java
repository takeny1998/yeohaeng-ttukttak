package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.aop.CrudPermission;
import com.yeohaeng_ttukttak.server.common.aop.PermissionCheckable;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelParticipantRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
public class TravelParticipantChecker implements PermissionCheckable {

    private final TravelParticipantRepository travelParticipantRepository;

    @Override
    public boolean check(Object targetId, String memberId) {

        if (targetId instanceof Long travelId) {

            final List<Member> invitees = travelParticipantRepository
                    .findAllByTravelId(travelId)
                    .stream()
                    .map(TravelParticipant::invitee)
                    .toList();

            return invitees.stream()
                    .anyMatch(invitee -> invitee.uuid().equals(memberId));

        }

        return false;
    }

    @Override
    public CrudPermission[] supports() {
        return new CrudPermission[] { CrudPermission.READ, CrudPermission.UPDATE };
    }

    @Override
    public Class<?> target() {
        return Travel.class;
    }
}
