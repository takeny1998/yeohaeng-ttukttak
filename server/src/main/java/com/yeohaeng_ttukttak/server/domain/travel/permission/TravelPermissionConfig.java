package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.aop.RoleBasedPermissionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TravelPermissionConfig {

    @Autowired
    public void register(RoleBasedPermissionManager roleBasedPermissionManager) {

        roleBasedPermissionManager.register(new TravelCreatorPermission());
        roleBasedPermissionManager.register(new TravelParticipantPermission());

    }

}
