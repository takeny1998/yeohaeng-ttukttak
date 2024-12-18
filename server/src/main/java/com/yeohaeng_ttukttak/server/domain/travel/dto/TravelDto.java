package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.CityDto;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;

import java.time.LocalDate;
import java.util.List;

public record TravelDto(
        Long id,
        LocalDate startedOn,
        LocalDate endedOn,
        String memberId,
        List<CompanionType> companionTypes,
        List<MotivationType> motivationTypes,
        List<CityDto> cities
) {

    public static TravelDto of(Travel travel) {

        return new TravelDto(
                travel.id(),
                travel.startedOn(),
                travel.endedOn(),
                travel.createdBy().uuid(),
                travel.companions().stream()
                        .map(TravelCompanion::type)
                        .toList(),
                travel.motivations().stream()
                        .map(TravelMotivation::type)
                        .toList(),
                travel.cities().stream()
                        .map(TravelCity::city)
                        .map(CityDto::of)
                        .toList()
        );
    }

}
