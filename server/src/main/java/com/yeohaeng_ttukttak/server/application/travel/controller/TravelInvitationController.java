package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelInvitationResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelInvitationService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.doc.travel.TravelInvitationDocument;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelInvitationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/v2/travels/{travelId}/invitations")
@RequiredArgsConstructor
public class TravelInvitationController implements TravelInvitationDocument {

    private final TravelInvitationService invitationService;

    @PostMapping
    @Authentication
    public TravelInvitationResponse create(
            @PathVariable Long travelId) {

        final String uuid = AuthenticationContextHolder
                .getContext().uuid();

        final TravelInvitationDto dto = invitationService
                .create(travelId, uuid);

        return new TravelInvitationResponse(dto);
    }

}
