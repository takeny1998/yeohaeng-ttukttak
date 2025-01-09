package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.aop.CrudPermission;
import com.yeohaeng_ttukttak.server.common.aop.PermissionCheckable;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class TravelCreatorChecker implements PermissionCheckable {

    private final TravelRepository travelRepository;

    @Override
    public boolean check(Object resourceId, String memberId) {

        if (resourceId instanceof Long travelId) {

            final Travel travel = travelRepository.findById(travelId)
                    .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

            return travel.createdBy().uuid().equals(memberId);

        }

        return false;

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
    public Class<?> target() {
        return Travel.class;
    }
}
