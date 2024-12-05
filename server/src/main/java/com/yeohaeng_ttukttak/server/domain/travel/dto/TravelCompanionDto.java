package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanion;

public record TravelCompanionDto(
        Long id,
        CompanionType type
) {

    public static TravelCompanionDto of(TravelCompanion travelCompanion) {
        return new TravelCompanionDto(
                travelCompanion.id(),
                travelCompanion.type()
        );
    }
}
