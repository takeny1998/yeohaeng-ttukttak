package com.yeohaeng_ttukttak.server.application.travel_plan.dto;

import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record MoveTravelPlanRequest(
        @NotNull Integer orderOfPlan,
        @NotNull LocalDate willVisitOn
) {}
