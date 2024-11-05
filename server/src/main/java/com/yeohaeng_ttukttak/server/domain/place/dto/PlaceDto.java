package com.yeohaeng_ttukttak.server.domain.place.dto;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;

import java.util.List;

public record PlaceDto(
        Long id,
        String name,
        PlaceAddress address,
        PlaceCoordinates coordinates,
        List<PlaceCategoryType> categoryTypes
) {

    public static PlaceDto of(Place place) {
        return of(place, place.categories());
    }

    public static PlaceDto of(Place place, List<PlaceCategory> categories) {

        return new PlaceDto(
                place.id(),
                place.name(),
                new PlaceAddress(
                        place.lotNumberAddress(), place.roadAddress()),
                new PlaceCoordinates(
                        place.longitude(), place.latitude()),
                categories.stream()
                        .map(PlaceCategory::type)
                        .toList()
        );
    }

    public record PlaceAddress(
            String lotNumber,
            String road
    ) {}

    public record PlaceCoordinates(
            Double longitude,
            Double latitude
    ) {}

}
