package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanMoveRequest;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.common.dto.VoidResponse;
import com.yeohaeng_ttukttak.server.doc.travel.TravelPlanDocument;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/plans")
@RequiredArgsConstructor
public class TravelPlanController implements TravelPlanDocument {

    private final TravelPlanService travelPlanService;

    @PostMapping
    @Authentication
    public TravelPlanResponse create(
            @RequestBody TravelPlanCreateRequest request) {

        final Long travelId = request.travelId();
        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        final Long planId = travelPlanService.create(
                travelId, request.placeId(), request.dayOfTravel(), memberId);

        return new TravelPlanResponse(travelPlanService.findById(planId));
    }

}
