package com.yeohaeng_ttukttak.server.application.travel_city_attraction.dto;

import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollResult;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel_city_attraction.AttractionDto;

import java.util.Objects;

public final class AttractionPageResponse extends ServerSuccessResponse<AttractionPageResponse.Data> {

    public AttractionPageResponse(InfiniteScrollResult<AttractionDto> attractions) {
        super(new Data(attractions));
    }

    public record Data(
            InfiniteScrollResult<AttractionDto> attractions) { }

}
