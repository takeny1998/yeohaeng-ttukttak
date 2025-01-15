package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.authorization.CrudOperation;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.RoleBasedPermission;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import lombok.extern.slf4j.Slf4j;

import java.util.Objects;

@Slf4j
public class TravelCreatorPermission implements RoleBasedPermission<Travel> {

    @Override
    public boolean checkGrantable(Travel travel, String memberId) {
        final Member member = travel.createdBy();

        // 엔티티 영속(PERSIST) 전인 경우,
        // 현재 동작의 주체가 생성자라고 판단할 수 있다.
        if (Objects.isNull(member)) {
            return true;
        }

        return member.uuid().equals(memberId);
    }

    @Override
    public CrudOperation[] getAllowedOperations() {
        return new CrudOperation[] {
                CrudOperation.CREATE,
                CrudOperation.READ,
                CrudOperation.UPDATE,
                CrudOperation.DELETE
        };
    }

    @Override
    public Class<Travel> getTargetClass() {
        return Travel.class;
    }
}
