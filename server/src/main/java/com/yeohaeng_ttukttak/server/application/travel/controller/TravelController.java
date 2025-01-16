package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.doc.annotation.TravelDocument;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.application.travel_city.TravelCityService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@JsonRequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController implements TravelDocument {

    private final TravelService travelService;
    private final TravelCityService travelCityService;

    /**
     * 새로운 여행 계획을 생성합니다.
     *
     * @param request 생성할 여행 정보
     *
     */
    @PostMapping
    @Authentication
    public ServerResponse<TravelResponse> create(
            @RequestBody @Valid TravelRequest request) {

        final Long createdId = travelService.create(
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes(),
                request.cityIds());

        return toTravelResponse(createdId);
    }

    /**
     * 사용자 여행을 조회합니다.
     *
     * @param travelId 사용자 여행의 식별자
     */
    @GetMapping("/{travelId}")
    @Transactional(readOnly = true)
    public ServerResponse<TravelResponse> find(@PathVariable Long travelId) {

        return toTravelResponse(travelId);

    }

    @PatchMapping(value = "/{travelId}")
    @Authentication
    public ServerResponse<TravelResponse> update(
            @PathVariable Long travelId,
            @RequestBody TravelRequest request) {

        travelService.update(
                travelId,
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes(),
                request.cityIds());

        return toTravelResponse(travelId);
    }


    private ServerResponse<TravelResponse> toTravelResponse(Long travelId) {
        final TravelDto travelDto = travelService.findById(travelId);
        final List<GeographyDto> cityDtoList = travelCityService.findCities(travelId);

        return new ServerResponse<>(new TravelResponse(travelDto, cityDtoList));
    }

}
