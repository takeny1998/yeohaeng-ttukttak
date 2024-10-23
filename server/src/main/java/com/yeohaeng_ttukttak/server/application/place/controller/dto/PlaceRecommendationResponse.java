package com.yeohaeng_ttukttak.server.application.place.controller.dto;

import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;

import java.util.List;

public record PlaceRecommendationResponse(
        List<PlaceDto> places
) { }
