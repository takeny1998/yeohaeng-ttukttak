package com.yeohaeng_ttukttak.server.application.place.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;

public final class PlaceResponse extends ServerSuccessResponse<PlaceResponse.PlaceData> {

    public PlaceResponse(PlaceDto place) {
        super(new PlaceData(place));
    }

    public record PlaceData(PlaceDto place) { }
}
