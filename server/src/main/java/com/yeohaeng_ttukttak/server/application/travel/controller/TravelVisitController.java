package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelVisitService;
import com.yeohaeng_ttukttak.server.application.travel.service.DeleteTravelVisitService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelVisitsService;
import com.yeohaeng_ttukttak.server.application.travel.service.UpdateTravelVisitService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthorizationDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelVisitController {

    private final CreateTravelVisitService createService;
    private final FindTravelVisitsService findService;
    private final UpdateTravelVisitService updateService;
    private final DeleteTravelVisitService deleteService;

    @PostMapping("/{travelId}/visits")
    @Authorization
    public ServerResponse<Void> create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelVisitRequest request,
            AuthorizationDto authorization) {

        createService.call(
                travelId, authorization.memberId(), request.placeId(), request.dayOfTravel());

        return new ServerResponse<>();
    }

    @GetMapping("/{travelId}/visits")
    public ServerResponse<FindTravelVisitsResponse> find(
            @PathVariable Long travelId) {
        List<TravelVisitDto> dtoList = findService.call(travelId);

        return new ServerResponse<>(new FindTravelVisitsResponse(dtoList));
    }

    @PatchMapping("/{travelId}/visits/{visitId}")
    @Authorization
    public ServerResponse<UpdateTravelVisitResponse> update(
            @PathVariable Long travelId,
            @PathVariable Long visitId,
            @Valid @RequestBody UpdateTravelVisitRequest request,
            AuthorizationDto authorization) {

        updateService.call(request.toCommand(visitId, travelId, authorization.memberId()));

        List<TravelVisitDto> dtoList = findService.call(travelId);

        return new ServerResponse<>(new UpdateTravelVisitResponse(dtoList));
    }

    @DeleteMapping("/{travelId}/visits/{visitId}")
    @Authorization
    public ServerResponse<Void> delete(
            @PathVariable Long travelId,
            @PathVariable Long visitId,
            AuthorizationDto authorization) {

        deleteService.call(travelId, visitId, authorization.memberId());
        return new ServerResponse<>();
    }

}
