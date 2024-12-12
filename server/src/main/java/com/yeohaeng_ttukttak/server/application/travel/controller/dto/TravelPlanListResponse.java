package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;

import java.util.List;

public record TravelPlanListResponse(List<TravelPlanDto> plans) { }
