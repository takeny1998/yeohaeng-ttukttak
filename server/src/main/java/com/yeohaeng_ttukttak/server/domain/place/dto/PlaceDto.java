package com.yeohaeng_ttukttak.server.domain.place.dto;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;

public record PlaceDto(
        Long id,
        String name,
        PlaceAddress address,
        PlaceCoordinates coordinates
) {

    public static PlaceDto of(Place place) {
        return new PlaceDto(
                place.id(),
                place.name(),
                new PlaceAddress(
                        place.lotNumberAddress(), place.roadAddress()),
                new PlaceCoordinates(
                        place.longitude(), place.latitude())
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
