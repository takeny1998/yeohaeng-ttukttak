package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;

import java.util.List;

public record FindTravelsByCityResponse(
        List<TravelDto> travels
) { }
