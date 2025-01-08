package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelInvitationResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelInvitationService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelInvitationService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
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
    @Authentication
    public ServerResponse<CreateTravelInvitationResponse> create(
            @PathVariable Long travelId,
            AuthenticationContext authorization
    ) {

        log.debug("get = {}", authorization);

        final String createdId = createService.createOne(
                authorization.uuid(), travelId);
        final TravelInvitationDto dto = findService.findOne(travelId, createdId);

        return new ServerResponse<>(
                new CreateTravelInvitationResponse(dto));
    }

}
