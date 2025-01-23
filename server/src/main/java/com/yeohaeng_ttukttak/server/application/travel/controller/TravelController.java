package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelUpdateRequest;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelRoleService;
import com.yeohaeng_ttukttak.server.doc.TravelDocument;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@RestController
@JsonRequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController implements TravelDocument {

    private final TravelService travelService;

    private final TravelRoleService travelRoleService;

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

    @PatchMapping(value = "/{travelId}")
    @Authentication
    public TravelResponse update(
            @PathVariable Long travelId,
            @RequestBody TravelUpdateRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(travelRoleService.creator(travelId))
                .or(travelRoleService.participant(travelId))
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
        return new TravelResponse(travelDto);
    }

}
