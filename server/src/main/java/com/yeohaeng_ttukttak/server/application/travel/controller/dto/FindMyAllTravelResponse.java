package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;

import java.util.List;

public record FindMyAllTravelResponse(
        List<TravelDto> travels
) { }