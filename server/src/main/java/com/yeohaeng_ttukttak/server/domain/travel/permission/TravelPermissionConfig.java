package com.yeohaeng_ttukttak.server.domain.travel.permission;

import com.yeohaeng_ttukttak.server.common.aop.PermissionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TravelPermissionConfig {

    @Autowired
    public void register(PermissionManager permissionManager) {

        permissionManager.register(new TravelCreatorChecker());
        permissionManager.register(new TravelParticipantChecker());

    }

}
