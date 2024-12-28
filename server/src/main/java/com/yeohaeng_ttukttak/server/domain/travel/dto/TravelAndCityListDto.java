package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;

import java.util.List;

public record TravelAndCityListDto(
        TravelDto travel,
        List<GeographyDto> cities) { }
