package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;

public record FindTravelInvitationResponse(
        TravelInvitationDto invitation
) { }
