package com.yeohaeng_ttukttak.server.application.geography.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;

import java.util.List;

public final class GeographyListResponse extends ServerSuccessResponse<GeographyListResponse.GeographyListData> {


    public GeographyListResponse(List<GeographyDto> geographies) {
        super(new GeographyListData(geographies));
    }

    public record GeographyListData(List<GeographyDto> geographies) { }

}
