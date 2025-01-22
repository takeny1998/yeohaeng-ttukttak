package com.yeohaeng_ttukttak.server.domain.travel.role;

import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Role;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;

public class TravelCreatorRole implements Role {

    private final String creatorId;

    public TravelCreatorRole(final Travel travel) {
        this.creatorId = travel.createdBy().uuid();
    }

    @Override
    public boolean checkGrantable(final String memberId) {
        return creatorId.equals(memberId);
    }

}
