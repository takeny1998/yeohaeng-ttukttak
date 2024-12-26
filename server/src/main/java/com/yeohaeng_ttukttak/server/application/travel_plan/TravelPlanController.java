package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.application.travel_plan.dto.CreateTravelPlanRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.MoveTravelPlanRequest;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/plans")
@RequiredArgsConstructor
@Slf4j
public class TravelPlanController {

    private final TravelPlanService travelPlanService;

    @PostMapping
    @Authorization
    public ServerResponse<TravelPlanListResponse> create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelPlanRequest request,
            AuthenticationContext authorization) {

        travelPlanService.create(
                authorization.uuid(),
                travelId,
                request.placeId(),
                request.dayOfTravel());

        return responsePlanList(travelId);
    }

    @GetMapping
    public ServerResponse<TravelPlanListResponse> findAll(
            @PathVariable Long travelId) {
        return responsePlanList(travelId);
    }

    @PatchMapping("/{planId}")
    @Authorization
    public ServerResponse<TravelPlanListResponse> move(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @Valid @RequestBody MoveTravelPlanRequest request,
            AuthenticationContext context) {

        travelPlanService.move(
                context.uuid(), travelId, planId, request.orderOfPlan(), request.willVisitOn());

        return responsePlanList(travelId);
    }

    @DeleteMapping("/{planId}")
    @Authorization
    public ServerResponse<TravelPlanListResponse> delete(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            AuthenticationContext context) {

        travelPlanService.delete(context.uuid(), travelId, planId);

        return responsePlanList(travelId);
    }

    private ServerResponse<TravelPlanListResponse> responsePlanList(Long travelId) {
        final List<TravelPlanDto> dtoList = travelPlanService.findAll(travelId);
        return new ServerResponse<>(new TravelPlanListResponse(dtoList));
    }

}
