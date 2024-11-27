package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.JoinTravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelParticipantService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/participants")
@RequiredArgsConstructor
public class TravelParticipantController {

    private final TravelParticipantService participantService;

    @PostMapping
    @Authorization
    public ServerResponse<Void> join(
            @PathVariable Long travelId,
            @Valid @RequestBody JoinTravelRequest request,
            AccessTokenDto accessToken) {

        participantService.join(travelId, request.invitationId(), accessToken.memberId());
        return new ServerResponse<>();
    }

    @DeleteMapping("/{participantId}")
    @Authorization
    public ServerResponse<Void> kick(
            @PathVariable Long travelId,
            @PathVariable Long participantId,
            AccessTokenDto accessToken) {

        participantService.kick(travelId, accessToken.memberId(), participantId);
        return new ServerResponse<>();
    }

}
