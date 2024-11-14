package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelVisitRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelVisitResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelVisitsResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelVisitService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelVisitsService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelVisitController {

    private final CreateTravelVisitService createService;
    private final FindTravelVisitsService findService;

    @PostMapping("/{travelId}/visits")
    @Authorization
    public ServerResponse<CreateTravelVisitResponse> create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelVisitRequest request,
            AccessTokenDto accessToken) {

        TravelVisitDto dto = createService.call(
                travelId, accessToken.memberId(), request.placeId());

        return new ServerResponse<>(new CreateTravelVisitResponse(dto));
    }

    @GetMapping("/{id}/visits")
    public ServerResponse<FindTravelVisitsResponse> find(
            @PathVariable Long id) {
        List<TravelVisitDto> dtoList = findService.call(id);

        return new ServerResponse<>(new FindTravelVisitsResponse(dtoList));
    }


}
