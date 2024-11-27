package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import com.yeohaeng_ttukttak.server.domain.travel.service.TravelInvitationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FindTravelInvitationService {

    private final TravelInvitationService invitationService;

    public TravelInvitationDto findOne(Long travelId, String invitationId) {
        final TravelInvitation invitation = invitationService.find(travelId, invitationId);

        return TravelInvitationDto.of(invitation);
    }

}
