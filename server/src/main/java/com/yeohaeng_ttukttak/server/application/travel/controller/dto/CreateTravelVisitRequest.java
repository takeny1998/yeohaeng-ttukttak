package com.yeohaeng_ttukttak.server.application.travel.controller.dto;


import jakarta.validation.constraints.NotNull;

public record CreateTravelVisitRequest(
       @NotNull Long placeId
) { }
