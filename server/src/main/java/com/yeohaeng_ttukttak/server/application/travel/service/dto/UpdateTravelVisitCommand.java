package com.yeohaeng_ttukttak.server.application.travel.service.dto;

public record UpdateTravelVisitCommand(
        Long id,
        Integer orderOfVisit,
        Integer dayOfTravel
) { }