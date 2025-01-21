package com.yeohaeng_ttukttak.server.application.travel_city_attraction.dto;

import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollResult;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel_city_attraction.AttractionDto;

public final class AttractionPageResponse extends ServerSuccessResponse<AttractionPageResponse.AttractionPageData> {

    public AttractionPageResponse(InfiniteScrollResult<AttractionDto> attractions) {
        super(new AttractionPageData(attractions));
    }

    public record AttractionPageData(
            InfiniteScrollResult<AttractionDto> attractions) { }

}
