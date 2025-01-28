package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanMoveRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelParticipantService;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelUpdateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantListResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.doc.travel.TravelDocument;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController implements TravelDocument {

    private final TravelService travelService;
    private final TravelPlanService travelPlanService;
    private final TravelParticipantService travelParticipantService;

    @PostMapping
    @Authentication
    public TravelResponse create(
            @RequestBody @Valid TravelCreateRequest request) {

        final Long createdId = travelService.create(
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes(),
                request.cityIds());

        return toTravelResponse(createdId);
    }

    @GetMapping("/{travelId}")
    @Transactional(readOnly = true)
    public TravelResponse find(@PathVariable Long travelId) {
        return toTravelResponse(travelId);
    }

    @GetMapping("/{travelId}/participants")
    public TravelParticipantListResponse findAllParticipants(
            @PathVariable Long travelId) {

        return toParticipantListResponse(travelId);
    }

    @GetMapping("/{travelId}/plans")
    public TravelPlanListResponse findAllPlans(@PathVariable Long travelId) {
        return toPlanListResponse(travelId);
    }

    @PatchMapping(value = "/{travelId}")
    @Authentication
    public TravelResponse update(
            @PathVariable Long travelId,
            @RequestBody TravelUpdateRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        travelService.update(
                travelId,
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes(),
                request.cityIds(),
                memberId);

        return toTravelResponse(travelId);
    }

    @PatchMapping("/{travelId}/plans/{planId}")
    @Authentication
    public TravelPlanListResponse movePlan(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @RequestBody TravelPlanMoveRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        travelPlanService.move(
                travelId, planId, request.orderOfPlan(), request.willVisitOn(), memberId);

        return toPlanListResponse(travelId);
    }

    @DeleteMapping("/{travelId}/participants/{participantId}")
    @Authentication
    public TravelParticipantListResponse kickParticipant(
            @PathVariable Long travelId,
            @PathVariable Long participantId) {

        final String kickerId =
                AuthenticationContextHolder.getContext().uuid();

        travelParticipantService.delete(participantId, kickerId);

        return toParticipantListResponse(travelId);
    }

    @DeleteMapping("/{travelId}/plans/{planId}")
    @Authentication
    public TravelPlanListResponse deletePlan(
            @PathVariable Long travelId, @PathVariable Long planId) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        travelPlanService.delete(travelId, planId, memberId);

        return toPlanListResponse(travelId);
    }

    private TravelResponse toTravelResponse(Long travelId) {
        final TravelDto travelDto = travelService.findById(travelId);
        return new TravelResponse(travelDto);
    }

    private TravelParticipantListResponse toParticipantListResponse(Long travelId) {
        final List<TravelParticipantDto> dtoList =
                travelParticipantService.findAllByTravelId(travelId);

        return new TravelParticipantListResponse(dtoList);
    }

    private TravelPlanListResponse toPlanListResponse(Long travelId) {
        final List<TravelPlanDto> dtoList = travelPlanService.findAllByTravelId(travelId);
        return new TravelPlanListResponse(dtoList);
    }

}
