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
public class TravelParticipantChecker implements PermissionCheckable<Travel> {

    @Override
    public boolean check(Travel travel, String memberId) {

        final List<Member> invitees = travel.participants()
                .stream()
                .map(TravelParticipant::invitee)
                .toList();

        return invitees.stream()
                .anyMatch(invitee -> invitee.uuid().equals(memberId));

    }

    @Override
    public CrudPermission[] supports() {
        return new CrudPermission[] { CrudPermission.READ, CrudPermission.UPDATE };
    }

    @Override
    public Class<Travel> target() {
        return Travel.class;
    }
}
