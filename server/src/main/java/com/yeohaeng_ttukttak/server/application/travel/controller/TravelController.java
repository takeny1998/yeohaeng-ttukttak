package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.application.travel_city.TravelCityService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import java.util.List;
import java.util.Locale;

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
    public ServerResponse<CreateTravelResponse> create(
            @RequestBody @Valid CreateTravelRequest request) {

        final Long createdId = travelService.create(
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes(),
                request.cityIds());

        final TravelDto travelDto = travelService.findById(createdId);
        final List<GeographyDto> cityDtoList = travelCityService.findCities(createdId);

        return new ServerResponse<>(new CreateTravelResponse(travelDto, cityDtoList));
    }

    /**
     * 사용자 여행을 조회합니다.
     *
     * @param travelId 사용자 여행의 식별자
     * @return 조회된 사용자 여행
     */
    @GetMapping("/{travelId}")
    @Transactional(readOnly = true)
    public ServerResponse<FindTravelResponse> find(@PathVariable Long travelId) {

        Travel foundTravel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return new ServerResponse<>(
                new FindTravelResponse(TravelDto.of(foundTravel)));

    }

}
