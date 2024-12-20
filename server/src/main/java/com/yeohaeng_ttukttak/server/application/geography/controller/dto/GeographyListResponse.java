package com.yeohaeng_ttukttak.server.application.geography.controller.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;

import java.util.List;

public record GeographyListResponse(
        List<GeographyDto> geographies
) { }
