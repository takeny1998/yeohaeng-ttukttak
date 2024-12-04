package com.yeohaeng_ttukttak.server.application.travel.controller.dto;


import jakarta.validation.constraints.NotNull;

public record CreateTravelPlanRequest(
       @NotNull Long placeId,
       @NotNull Integer dayOfTravel
) { }
