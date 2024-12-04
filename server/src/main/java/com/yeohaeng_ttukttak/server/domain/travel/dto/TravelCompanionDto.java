package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanion;

public record TravelCompanionDto(
        Long id,
        TravelCompanionType type
) {

    public static TravelCompanionDto of(TravelCompanion travelCompanion) {
        return new TravelCompanionDto(
                travelCompanion.id(),
                travelCompanion.type()
        );
    }
}
