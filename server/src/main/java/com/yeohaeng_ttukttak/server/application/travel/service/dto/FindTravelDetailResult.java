package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelDetailResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.CityDto;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCity;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;

import java.util.List;

public record FindTravelDetailResult(
        TravelDto travel,
        List<TravelVisitDto> visits,
        List<PlaceDto> places,
        List<CityDto> cities
) {

    public static FindTravelDetailResult of(
            TravelDto travel,
            List<TravelVisit> visits,
            List<Place> places,
            List<City> cities) {

        return new FindTravelDetailResult(
                travel,
                visits.stream().map(TravelVisitDto::of).toList(),
                places.stream().map(PlaceDto::of).toList(),
                cities.stream().map(CityDto::of).toList()
        );
    }

    public FindTravelDetailResponse toResponse() {
        return new FindTravelDetailResponse(
                travel, visits, places, cities);
    }
}
