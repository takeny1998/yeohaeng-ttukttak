package com.yeohaeng_ttukttak.server.domain.place.dto;

public record PlaceMetricDto(
        PlaceDto place,
        Double rating,
        Long visitCount
) {

    public static PlaceMetricDto of (PlaceMetricRecord record) {
        return new PlaceMetricDto(
                PlaceDto.of(record.place()),
                record.rating(),
                record.visitCount());
    }

}