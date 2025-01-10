package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.authorization.CrudOperation;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.RoleBasedPermission;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TravelCreatorPermission implements RoleBasedPermission<Travel> {

    @Override
    public boolean checkGrantable(Travel travel, String memberId) {
        return travel.createdBy().uuid().equals(memberId);
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
