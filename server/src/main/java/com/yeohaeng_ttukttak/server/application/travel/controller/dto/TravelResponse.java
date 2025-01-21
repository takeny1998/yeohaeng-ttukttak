package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import lombok.ToString;

import java.util.List;

@ToString
public final class TravelResponse extends ServerSuccessResponse<TravelResponse.TravelData> {

    public TravelResponse(TravelDto travel, List<GeographyDto> cities) {
        super(new TravelData(travel, cities));
    }

    public record TravelData(
            TravelDto travel,
            List<GeographyDto> cities) {}

}