package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelVisitService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelVisitsService;
import com.yeohaeng_ttukttak.server.application.travel.service.UpdateAllTravelVisitService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
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
    private final UpdateAllTravelVisitService updateAllService;

    @PostMapping("/{travelId}/visits")
    @Authorization
    public ServerResponse<Void> create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelVisitRequest request,
            AccessTokenDto accessToken) {

        createService.call(
                travelId, accessToken.memberId(), request.placeId(), request.dayOfTravel());

        return new ServerResponse<>();
    }

    @GetMapping("/{travelId}/visits")
    public ServerResponse<FindTravelVisitsResponse> find(
            @PathVariable Long travelId) {
        List<TravelVisitDto> dtoList = findService.call(travelId);

        return new ServerResponse<>(new FindTravelVisitsResponse(dtoList));
    }

    @PutMapping("/{travelId}/visits")
    @Authorization
    public ServerResponse<UpdateAllTravelVisitResponse> updateAll(
            @PathVariable Long travelId,
            @Valid @RequestBody UpdateAllTravelVisitRequest request) {

        List<TravelVisitDto> dtoList = updateAllService.call(travelId, request.visits());

        return new ServerResponse<>(new UpdateAllTravelVisitResponse(dtoList));
    }

}
