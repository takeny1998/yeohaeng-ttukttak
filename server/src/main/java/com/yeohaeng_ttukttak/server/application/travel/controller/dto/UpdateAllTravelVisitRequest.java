package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.controller.validator.ValidateUpdateAllTravelVisitRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;
import jakarta.validation.Valid;

import java.util.List;

@ValidateUpdateAllTravelVisitRequest
public record UpdateAllTravelVisitRequest(
        @Valid List<UpdateTravelVisitCommand> visits
) { }
