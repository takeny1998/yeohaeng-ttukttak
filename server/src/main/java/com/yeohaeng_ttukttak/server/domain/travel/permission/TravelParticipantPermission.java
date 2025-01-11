package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.authorization.CrudOperation;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.RoleBasedPermission;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
public class TravelParticipantPermission implements RoleBasedPermission<Travel> {

    @Override
    public boolean checkGrantable(Travel travel, String memberId) {

        final List<Member> invitees = travel.participants()
                .stream()
                .map(TravelParticipant::invitee)
                .toList();

        return invitees.stream()
                .anyMatch(invitee -> invitee.uuid().equals(memberId));

    }

    @Override
    public CrudOperation[] getAllowedOperations() {
        return new CrudOperation[] { CrudOperation.READ, CrudOperation.UPDATE };
    }

    @Override
    public Class<Travel> getTargetClass() {
        return Travel.class;
    }
}
