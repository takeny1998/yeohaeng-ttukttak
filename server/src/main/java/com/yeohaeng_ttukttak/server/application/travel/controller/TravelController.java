package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.application.travel_city.TravelCityService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController implements TravelDocument {

    private final TravelService travelService;
    private final TravelCityService travelCityService;

    private final TravelRepository travelRepository;

    @PostMapping
    @Authorization
    public ServerResponse<CreateTravelResponse> create(
            @RequestBody @Valid CreateTravelRequest request,
            AuthenticationContext context) {

        final Locale locale = LocaleContextHolder.getLocale();

        final Long createdId = travelService.create(
                locale,
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes(),
                request.cityIds(),
                context.uuid());

        final TravelDto travelDto = travelService.findById(createdId);
        final List<GeographyDto> cityDtoList = travelCityService.findCities(createdId);

        return new ServerResponse<>(new CreateTravelResponse(travelDto, cityDtoList));
    }

    @GetMapping("/{id}")
    @Transactional(readOnly = true)
    public ServerResponse<FindTravelResponse> find(@PathVariable Long id) {
        Travel foundTravel = travelRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return new ServerResponse<>(
                new FindTravelResponse(TravelDto.of(foundTravel)));
    }

}
