package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.service.TravelParticipantService;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelUpdateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantListResponse;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelRoleService;
import com.yeohaeng_ttukttak.server.doc.travel.TravelDocument;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController implements TravelDocument {

    private final TravelService travelService;

    private final TravelRoleService travelRoleService;

    private final TravelParticipantService travelParticipantService;

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

    @GetMapping("/{travelId}/participants")
    public TravelParticipantListResponse findParticipants(
            @PathVariable Long travelId) {

        return toParticipantListResponse(travelId);
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

    @DeleteMapping("/{travelId}/participants/{participantId}")
    @Authentication
    public TravelParticipantListResponse kickParticipant(
            @PathVariable Long travelId,
            @PathVariable Long participantId) {

        final String kickerId =
                AuthenticationContextHolder.getContext().uuid();

        travelParticipantService.delete(participantId, kickerId);

        return toParticipantListResponse(travelId);
    }

    private TravelParticipantListResponse toParticipantListResponse(Long travelId) {
        final List<TravelParticipantDto> dtoList =
                travelParticipantService.findAllByTravelId(travelId);

        return new TravelParticipantListResponse(dtoList);
    }

    private TravelResponse toTravelResponse(Long travelId) {
        final TravelDto travelDto = travelService.findById(travelId);
        return new TravelResponse(travelDto);
    }

}
