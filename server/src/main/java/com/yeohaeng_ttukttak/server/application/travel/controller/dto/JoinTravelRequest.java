package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import jakarta.validation.constraints.NotEmpty;

public record JoinTravelRequest (
        @NotEmpty String invitationId
) { }
