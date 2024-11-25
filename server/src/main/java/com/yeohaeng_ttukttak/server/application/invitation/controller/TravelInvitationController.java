package com.yeohaeng_ttukttak.server.application.invitation.controller;

import com.yeohaeng_ttukttak.server.application.invitation.controller.dto.CreateTravelInvitationRequest;
import com.yeohaeng_ttukttak.server.application.invitation.service.TravelInvitationService;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelInvitationResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelInvitationResponse;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/v2/invitations")
@RequiredArgsConstructor
public class TravelInvitationController {

    private final TravelInvitationService invitationService;

    @PostMapping
    @Authorization
    public ServerResponse<CreateTravelInvitationResponse> create(
            @RequestBody CreateTravelInvitationRequest request,
            AccessTokenDto accessToken
    ) {

        final String createdId = invitationService.create(
                accessToken.memberId(), request.travelId());

        final TravelInvitationDto dto = invitationService.find(createdId);

        return new ServerResponse<>(
                new CreateTravelInvitationResponse(dto));
    }

    @GetMapping("/{id}")
    public ServerResponse<FindTravelInvitationResponse> find(
            @PathVariable String id) {

        final TravelInvitationDto dto = invitationService.find(id);

        return new ServerResponse<>(
                new FindTravelInvitationResponse(dto));
    }

    @PostMapping("/{id}/accept")
    @Authorization
    public ServerResponse<Void> accept(
            @PathVariable String id,
            AccessTokenDto accessToken) {

        invitationService.accept(id, accessToken.memberId());
        return new ServerResponse<>();
    }

}
