package com.yeohaeng_ttukttak.server.application.travel_city.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;

import java.util.List;

public record CityListResponse(
        List<GeographyDto> cities) { }
