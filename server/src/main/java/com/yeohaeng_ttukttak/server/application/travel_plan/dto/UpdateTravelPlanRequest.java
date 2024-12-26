package com.yeohaeng_ttukttak.server.application.travel_plan.dto;

import java.time.LocalDate;

public record UpdateTravelPlanRequest(
        Integer orderOfPlan,
        LocalDate willVisitOn
) {}
