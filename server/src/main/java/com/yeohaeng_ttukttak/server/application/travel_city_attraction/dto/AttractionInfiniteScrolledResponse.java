package com.yeohaeng_ttukttak.server.application.travel_city_attraction.dto;

import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollResult;
import com.yeohaeng_ttukttak.server.domain.travel_city_attraction.AttractionDto;

public record AttractionInfiniteScrolledResponse(
        InfiniteScrollResult<AttractionDto> attractions) { }
