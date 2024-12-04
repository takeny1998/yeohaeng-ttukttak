package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.CityDto;
import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;

import java.time.LocalDate;
import java.util.List;

public record TravelDto(
        Long id,
        LocalDate startedOn,
        LocalDate endedOn,
        AgeGroup ageGroup,
        Gender gender,
        String memberId,
        List<TravelCompanionDto> companions,
        List<TravelMotivationType> motivationTypes,
        List<CityDto> cities
) {

    public static TravelDto of(Travel travel) {
        final String memberId = travel instanceof MemberTravel
                ? ((MemberTravel) travel).member().id()
                : null;

        return new TravelDto(
                travel.id(),
                travel.startedOn(),
                travel.endedOn(),
                travel.ageGroup(),
                travel.gender(),
                memberId,
                travel.companions().stream()
                        .map(TravelCompanionDto::of)
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
