package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.application.travel_city.TravelCityService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
@Tag(name = "여행 (Travel)", description = "사용자 여행과 관련된 동작을 수행하는 컬렉션 입니다.")
public class TravelController {

    private final TravelService travelService;
    private final TravelCityService travelCityService;

    private final TravelRepository travelRepository;

    /**
     * 새로운 여행 계획을 생성합니다.
     *
     * @param request 생성할 여행 정보
     * @return 생성된 여행 정보 및 도시 목록
     */
    @PostMapping
    @Authentication
    public ServerResponse<TravelResponse> create(
            @RequestBody @Valid CreateTravelRequest request) {

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
     * @return 조회된 사용자 여행
     */
    @GetMapping("/{travelId}")
    @Transactional(readOnly = true)
    public ServerResponse<TravelResponse> find(@PathVariable Long travelId) {

        return toTravelResponse(travelId);

    }

    @PatchMapping("/{travelId}")
    @Authentication
    public ServerResponse<TravelResponse> update(
            @PathVariable Long travelId, @RequestBody UpdateTravelRequest request) {

        travelService.update(
                travelId,
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes());

        return toTravelResponse(travelId);
    }


    private ServerResponse<TravelResponse> toTravelResponse(Long travelId) {
        final TravelDto travelDto = travelService.findById(travelId);
        final List<GeographyDto> cityDtoList = travelCityService.findCities(travelId);

        return new ServerResponse<>(new TravelResponse(travelDto, cityDtoList));
    }

}
