package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;

import jakarta.validation.constraints.NotEmpty;

public record TravelParticipantJoinRequest(
    @NotEmpty String invitationToken
) { }
