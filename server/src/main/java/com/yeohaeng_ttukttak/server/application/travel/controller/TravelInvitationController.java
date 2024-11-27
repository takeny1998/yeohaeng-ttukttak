package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelInvitationResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelInvitationService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelInvitationService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/v2/travels/{travelId}/invitations")
@RequiredArgsConstructor
public class TravelInvitationController {

    private final CreateTravelInvitationService createService;
    private final FindTravelInvitationService findService;

    @PostMapping
    @Authorization
    public ServerResponse<CreateTravelInvitationResponse> create(
            @PathVariable Long travelId,
            AccessTokenDto accessToken
    ) {

        final String createdId = createService.create(
                accessToken.memberId(), travelId);
        final TravelInvitationDto dto = findService.findOne(travelId, createdId);

        return new ServerResponse<>(
                new CreateTravelInvitationResponse(dto));
    }

}
