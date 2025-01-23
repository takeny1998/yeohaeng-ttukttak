package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantListResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelJoinRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelParticipantService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelParticipantDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/participants")
@RequiredArgsConstructor
public class TravelParticipantController {

    private final TravelParticipantService participantService;

    @PostMapping
    @Authentication
    public void join(
            @PathVariable Long travelId,
            @Valid @RequestBody TravelJoinRequest request,
            AuthenticationContext authorization) {

        participantService.join(travelId,
                request.invitationId(),
                authorization.uuid());
    }

    @GetMapping
    public TravelParticipantListResponse find(
            @PathVariable Long travelId) {
        final List<TravelParticipantDto> dtoList =
                participantService.find(travelId);

        return new TravelParticipantListResponse(dtoList);
    }

    @DeleteMapping("/{participantId}")
    @Authentication
    public void leave(
            @PathVariable Long travelId,
            @PathVariable Long participantId,
            AuthenticationContext authorization) {

        participantService.leave(travelId, authorization.uuid(), participantId);
    }

}
