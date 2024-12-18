package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.service.DeleteTravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.service.UpdateTravelPlanService;
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

    private final CreateTravelPlanService createService;
    private final FindTravelPlanService findService;
    private final UpdateTravelPlanService updateService;
    private final DeleteTravelPlanService deleteService;

    @PostMapping
    @Authorization
    public ServerResponse<TravelPlanListResponse> create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelPlanRequest request,
            AuthenticationContext authorization) {

        createService.createOne(
                travelId,
                authorization.uuid(),
                request.placeId(),
                request.dayOfTravel());

        final List<TravelPlanDto> dtoList = findService.findAll(travelId);

        return new ServerResponse<>(new TravelPlanListResponse(dtoList));
    }

    @GetMapping
    public ServerResponse<TravelPlanListResponse> find(
            @PathVariable Long travelId) {
        List<TravelPlanDto> dtoList = findService.findAll(travelId);
        return new ServerResponse<>(new TravelPlanListResponse(dtoList));
    }

    @PatchMapping("/{planId}")
    @Authorization
    public ServerResponse<TravelPlanListResponse> update(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @Valid @RequestBody UpdateTravelPlanRequest request,
            AuthenticationContext authorization) {

        updateService.call(request.toCommand(planId, travelId, authorization.uuid()));

        List<TravelPlanDto> dtoList = findService.findAll(travelId);

        return new ServerResponse<>(new TravelPlanListResponse(dtoList));
    }

    @DeleteMapping("/{planId}")
    @Authorization
    public ServerResponse<TravelPlanListResponse> delete(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            AuthenticationContext authorization) {

        deleteService.deleteOne(travelId, planId, authorization.uuid());
        final List<TravelPlanDto> dtoList = findService.findAll(travelId);

        return new ServerResponse<>(new TravelPlanListResponse(dtoList));
    }

}
