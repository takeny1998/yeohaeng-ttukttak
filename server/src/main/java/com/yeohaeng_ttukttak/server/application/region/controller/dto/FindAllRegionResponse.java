package com.yeohaeng_ttukttak.server.application.region.controller.dto;

import com.yeohaeng_ttukttak.server.domain.region.dto.RegionDto;

import java.util.List;

public record FindAllRegionResponse(
        List<RegionDto> regions
) { }
