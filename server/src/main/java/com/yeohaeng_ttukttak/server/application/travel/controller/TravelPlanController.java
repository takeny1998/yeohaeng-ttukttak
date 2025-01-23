package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanMoveRequest;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.doc.TravelPlanDocument;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@JsonRequestMapping("/api/v2/travels/{travelId}/plans")
@RequiredArgsConstructor
public class TravelPlanController implements TravelPlanDocument {

    private final TravelPlanService travelPlanService;

    private final TravelRoleService travelRoleService;

    @PostMapping
    @Authentication
    public TravelPlanListResponse create(
            @PathVariable Long travelId,
            @RequestBody TravelPlanCreateRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(travelRoleService.creator(travelId))
                .or(travelRoleService.participant(travelId))
                .authorize();

        travelPlanService.create(
                travelId, request.placeId(), request.dayOfTravel());

        return responsePlanList(travelId);
    }

    @GetMapping
    public TravelPlanListResponse findAll(
            @PathVariable Long travelId) {
        return responsePlanList(travelId);
    }

    @PatchMapping("/{planId}")
    @Authentication
    public TravelPlanListResponse move(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @RequestBody TravelPlanMoveRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(travelRoleService.creator(travelId))
                .or(travelRoleService.participant(travelId))
                .authorize();

        travelPlanService.move(travelId, planId, request.orderOfPlan(), request.willVisitOn());

        return responsePlanList(travelId);
    }

    @DeleteMapping("/{planId}")
    @Authentication
    public TravelPlanListResponse delete(
            @PathVariable Long travelId, @PathVariable Long planId) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(travelRoleService.creator(travelId))
                .or(travelRoleService.participant(travelId))
                .authorize();

        travelPlanService.delete(travelId, planId);

        return responsePlanList(travelId);
    }

    private TravelPlanListResponse responsePlanList(Long travelId) {
        final List<TravelPlanDto> dtoList = travelPlanService.findAll(travelId);
        return new TravelPlanListResponse(dtoList);
    }

}
