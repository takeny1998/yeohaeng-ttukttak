package com.yeohaeng_ttukttak.server.domain.travelogue.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travelogue.entity.Travelogue;
import com.yeohaeng_ttukttak.server.domain.travelogue.entity.TravelogueCompanion;
import com.yeohaeng_ttukttak.server.domain.travelogue.entity.TravelogueMotivation;

import java.time.LocalDate;
import java.util.List;

public record TravelogueDto(
        Long id,
        LocalDate startedOn,
        LocalDate endedOn,
        AgeGroup ageGroup,
        Gender gender,
        List<CompanionType> companionTypes,
        List<MotivationType> motivationTypes
) {

    public static TravelogueDto of(Travelogue travelogue) {
        return new TravelogueDto(
                travelogue.id(),
                travelogue.startedOn(),
                travelogue.endedOn(),
                travelogue.ageGroup(),
                travelogue.gender(),
                travelogue.companions().stream()
                        .map(TravelogueCompanion::type)
                        .toList(),
                travelogue.motivations().stream()
                        .map(TravelogueMotivation::type)
                        .toList()
        );
    }

}
