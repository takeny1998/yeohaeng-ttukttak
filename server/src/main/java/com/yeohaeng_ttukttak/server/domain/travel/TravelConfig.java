package com.yeohaeng_ttukttak.server.domain.travel;

import com.yeohaeng_ttukttak.server.common.aop.PermissionCheckerManager;
import com.yeohaeng_ttukttak.server.domain.travel.permission.TravelCreatorChecker;
import com.yeohaeng_ttukttak.server.domain.travel.permission.TravelParticipantChecker;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelParticipantRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TravelConfig {

    @Autowired
    public void registerTravelChecker(
            TravelRepository travelRepository,
            TravelParticipantRepository travelParticipantRepository,
            PermissionCheckerManager permissionCheckerManager) {

        permissionCheckerManager.register(new TravelParticipantChecker(travelParticipantRepository));
        permissionCheckerManager.register(new TravelCreatorChecker(travelRepository));

    }

}
