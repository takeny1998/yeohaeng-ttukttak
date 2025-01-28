package com.yeohaeng_ttukttak.server.application.participant.controller;

import com.yeohaeng_ttukttak.server.application.participant.controller.dto.request.ParticipantCreateRequest;
import com.yeohaeng_ttukttak.server.application.participant.controller.dto.request.ParticipantTokenCreateRequest;
import com.yeohaeng_ttukttak.server.application.participant.controller.dto.response.ParticipantResponse;
import com.yeohaeng_ttukttak.server.application.participant.controller.dto.response.ParticipantTokenResponse;
import com.yeohaeng_ttukttak.server.application.participant.service.ParticipantService;
import com.yeohaeng_ttukttak.server.application.participant.service.dto.ParticipantDto;
import com.yeohaeng_ttukttak.server.application.participant.service.dto.ParticipantTokenDto;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.doc.travel.ParticipantDocument;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2")
@RequiredArgsConstructor
public class ParticipantController implements ParticipantDocument {

    private final ParticipantService participantService;

    @PostMapping("/participant-token")
    @Authentication
    public ParticipantTokenResponse createToken(
            @RequestBody ParticipantTokenCreateRequest request) {

        final String uuid = AuthenticationContextHolder.getContext().uuid();

        final ParticipantTokenDto participantTokenDto =
                participantService.createToken(request.travelId(), uuid);

        return new ParticipantTokenResponse(participantTokenDto);
    }

    @PostMapping("/participants")
    @Authentication
    public ParticipantResponse updateByToken(
            @RequestBody ParticipantCreateRequest request) {

        final String inviteeId = AuthenticationContextHolder.getContext().uuid();

        final Long createdId = participantService
                .assignInvitee(request.participantToken(), inviteeId);

        final ParticipantDto participantDto = participantService.findById(createdId);

        return new ParticipantResponse(participantDto);
    }


}
