package com.yeohaeng_ttukttak.server.application.travel_city.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;

import java.util.List;

public record TravelAndCityListResponse(
        TravelDto travel,
        List<GeographyDto> cities) { }
