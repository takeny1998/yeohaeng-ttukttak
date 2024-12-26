package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelService;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController {

    private final TravelService travelService;
    private final FindTravelService findTravelService;
    private final TravelRepository travelRepository;

    @PostMapping
    @Authorization
    public ServerResponse<CreateTravelResponse> create(
            Locale locale,
            @RequestBody @Valid CreateTravelRequest request) {

        final Long createdId = travelService.create(
                locale,
                request.name(),
                request.startedOn(),
                request.endedOn(),
                request.motivationTypes(),
                request.companionTypes());

        final TravelDto travelDto = findTravelService.findById(createdId);

        return new ServerResponse<>(new CreateTravelResponse(travelDto));
    }

    @GetMapping("/{id}")
    @Transactional(readOnly = true)
    public ServerResponse<FindTravelResponse> find(@PathVariable Long id) {
        Travel foundTravel = travelRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return new ServerResponse<>(
                new FindTravelResponse(TravelDto.of(foundTravel)));
    }

    @GetMapping("/members/me")
    @Authorization
    public ServerResponse<FindMyAllTravelResponse> findMyAll(
            AuthenticationContext authorization) {

       return new ServerResponse<>(
               new FindMyAllTravelResponse(
                       findTravelService.findByMember(authorization.uuid())));
    }

}
