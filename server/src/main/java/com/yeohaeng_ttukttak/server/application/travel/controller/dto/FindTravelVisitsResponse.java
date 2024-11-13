package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;

import java.util.List;

public record FindTravelVisitsResponse(
        List<TravelVisitDto> visits) {}
