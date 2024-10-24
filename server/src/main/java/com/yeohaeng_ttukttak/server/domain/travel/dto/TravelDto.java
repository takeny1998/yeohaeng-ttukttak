package com.yeohaeng_ttukttak.server.domain.travel.dto;

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
        List<TravelCompanionDto> companions,
        List<Motivation> motivations
) {

    public static TravelDto of(Travel travel) {
        return new TravelDto(
                travel.id(),
                travel.startedOn(),
                travel.endedOn(),
                travel.ageGroup(),
                travel.gender(),
                travel.companions().stream()
                        .map(TravelCompanionDto::of)
                        .toList(),
                travel.motivations().stream()
                        .map(TravelMotivation::motivation)
                        .toList()
        );
    }

}
