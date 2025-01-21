package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import jakarta.validation.constraints.NotEmpty;

public record TravelJoinRequest(
        @NotEmpty String invitationId
) { }
