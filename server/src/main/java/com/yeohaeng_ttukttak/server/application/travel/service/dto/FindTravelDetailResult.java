package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelDetailResponse;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;

import java.util.List;

public record FindTravelDetailResult(
        List<TravelVisitDto> visits,
        List<PlaceDto> places
) {

    public static FindTravelDetailResult of
            (List<TravelVisit> visits, List<Place> places) {

        return new FindTravelDetailResult(
                visits.stream().map(TravelVisitDto::of).toList(),
                places.stream().map(PlaceDto::of).toList()
        );
    }

    public FindTravelDetailResponse toResponse() {
        return new FindTravelDetailResponse(
                visits, places);
    }
}
