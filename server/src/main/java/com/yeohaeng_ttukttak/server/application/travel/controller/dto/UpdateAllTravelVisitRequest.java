package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;

import java.util.List;

public record UpdateAllTravelVisitRequest(
        List<UpdateTravelVisitCommand> visits
) { }
