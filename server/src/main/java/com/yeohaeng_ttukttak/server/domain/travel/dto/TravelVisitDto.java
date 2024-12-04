package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlan;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;

@Slf4j
public record TravelVisitDto(
        Long id,
        Integer orderOfVisit,
        Long placeId,
        LocalDate visitedOn) {

    public static TravelVisitDto of(TravelPlan visit) {

        LocalDate visitedOn = null;

        if (visit.dayOfTravel() != null ) {
            visitedOn = visit.travel()
                    .startedOn()
                    .plusDays(visit.dayOfTravel());
        }

        return new TravelVisitDto(
                visit.id(),
                visit.orderOfVisit(),
                visit.place().id(),
                visitedOn
        );
    }

}
