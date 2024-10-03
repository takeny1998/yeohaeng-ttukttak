package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;

import java.util.List;

public record FindTravelDetailResponse(
        List<TravelVisitDto> visits,
        List<PlaceDto> places) {}
