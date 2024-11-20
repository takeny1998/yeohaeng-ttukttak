package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import java.time.LocalDate;

public record UpdateTravelVisitCommand(
        Long visitId,
        Long travelId,
        String memberId,
        Integer orderOfVisit,
        LocalDate visitedOn
) { }