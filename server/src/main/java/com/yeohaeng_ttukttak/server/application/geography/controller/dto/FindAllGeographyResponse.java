package com.yeohaeng_ttukttak.server.application.geography.controller.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.CityDto;
import com.yeohaeng_ttukttak.server.domain.geography.dto.RegionDto;

import java.util.List;

public record FindAllGeographyResponse(
        List<RegionDto> regions,
        List<CityDto> cities
) { }
