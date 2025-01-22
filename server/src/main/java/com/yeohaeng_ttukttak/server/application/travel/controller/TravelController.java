package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.*;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelRoleService;
import com.yeohaeng_ttukttak.server.doc.TravelDocument;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelCityService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
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

    private final TravelRoleService role;

    @PostMapping
    @Authentication
    public TravelResponse create(
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

    @GetMapping("/{travelId}")
    @Transactional(readOnly = true)
    public TravelResponse find(@PathVariable Long travelId) {
        return toTravelResponse(travelId);
    }

    @PatchMapping(value = "/{travelId}")
    @Authentication
    public TravelResponse update(
            @PathVariable Long travelId,
            @RequestBody TravelRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(role.creator(travelId))
                .or(role.participant(travelId))
                .authorize();

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


    private TravelResponse toTravelResponse(Long travelId) {
        final TravelDto travelDto = travelService.findById(travelId);
        final List<GeographyDto> cityDtoList = travelCityService.findCities(travelId);

        return new TravelResponse(travelDto, cityDtoList);
    }

}
