package com.yeohaeng_ttukttak.server.domain.place.dto;

import com.yeohaeng_ttukttak.server.domain.image.dto.ImageDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryMapping;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;

import java.util.List;

public record PlaceDto(
        Long id,
        String name,
        PlaceAddress address,
        PlaceCoordinates coordinates,
        List<PlaceCategory> categories
) {

    public static PlaceDto of(Place place) {
        return new PlaceDto(
                place.id(),
                place.name(),
                new PlaceAddress(
                        place.lotNumberAddress(), place.roadAddress()),
                new PlaceCoordinates(
                        place.longitude(), place.latitude()),
                place.categories().stream()
                        .map(PlaceCategoryMapping::category).toList()
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
