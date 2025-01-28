package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelParticipantCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelParticipantTokenCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantTokenResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelParticipantService;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantTokenDto;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.dto.VoidResponse;
import com.yeohaeng_ttukttak.server.doc.travel.TravelParticipantDocument;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2")
@RequiredArgsConstructor
public class TravelParticipantController implements TravelParticipantDocument {

    private final TravelParticipantService travelParticipantService;

    @PostMapping("/participant-token")
    @Authentication
    public TravelParticipantTokenResponse createToken(
            @RequestBody TravelParticipantTokenCreateRequest request) {

        final String uuid = AuthenticationContextHolder.getContext().uuid();

        final TravelParticipantTokenDto travelParticipantTokenDto =
                travelParticipantService.createToken(request.travelId(), uuid);

        return new TravelParticipantTokenResponse(travelParticipantTokenDto);
    }

    @PostMapping("/participants")
    @Authentication
    public TravelParticipantResponse create(
            @RequestBody TravelParticipantCreateRequest request) {

        final String inviteeId =
                AuthenticationContextHolder.getContext().uuid();

        final Long createdId = travelParticipantService
                .create(request.participantToken(), inviteeId);

        final TravelParticipantDto travelParticipantDto = travelParticipantService.findById(createdId);

        return new TravelParticipantResponse(travelParticipantDto);
    }

    @DeleteMapping("/participants/{participantId}")
    @Authentication
    public VoidResponse leave(@PathVariable Long participantId) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        travelParticipantService.delete(participantId, memberId);

        return new VoidResponse();
    }


}
