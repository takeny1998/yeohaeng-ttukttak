package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelParticipantsResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.JoinTravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelParticipantService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
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
    public ServerResponse<Void> join(
            @PathVariable Long travelId,
            @Valid @RequestBody JoinTravelRequest request,
            AuthenticationContext authorization) {

        participantService.join(travelId,
                request.invitationId(),
                authorization.uuid());

        return new ServerResponse<>();
    }

    @GetMapping
    public ServerResponse<FindTravelParticipantsResponse> find(
            @PathVariable Long travelId) {
        final List<TravelParticipantDto> dtoList =
                participantService.find(travelId);

        return new ServerResponse<>(
                new FindTravelParticipantsResponse(dtoList));
    }

    @DeleteMapping("/{participantId}")
    @Authentication
    public ServerResponse<Void> leave(
            @PathVariable Long travelId,
            @PathVariable Long participantId,
            AuthenticationContext authorization) {

        participantService.leave(travelId, authorization.uuid(), participantId);
        return new ServerResponse<>();
    }

}
