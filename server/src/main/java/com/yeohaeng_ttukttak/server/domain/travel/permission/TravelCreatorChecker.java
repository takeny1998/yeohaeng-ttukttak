package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.aop.CrudPermission;
import com.yeohaeng_ttukttak.server.common.aop.PermissionCheckable;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TravelCreatorChecker implements PermissionCheckable<Travel> {

    @Override
    public boolean check(Travel travel, String memberId) {
        return travel.createdBy().uuid().equals(memberId);
    }

    @Override
    public CrudPermission[] supports() {
        return new CrudPermission[] {
                CrudPermission.CREATE,
                CrudPermission.READ,
                CrudPermission.UPDATE,
                CrudPermission.DELETE
        };
    }

    @Override
    public Class<Travel> target() {
        return Travel.class;
    }
}
