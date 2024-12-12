package com.yeohaeng_ttukttak.server.domain.travel_plan;

import java.time.LocalDate;

public record TravelPlanDto(
        Long id,
        Integer orderOfVisit,
        Long placeId,
        LocalDate willVisitOn) {

    public static TravelPlanDto of(TravelPlan visit) {

        LocalDate visitedOn = null;

        if (visit.dayOfTravel() != null ) {
            visitedOn = visit.travel()
                    .startedOn()
                    .plusDays(visit.dayOfTravel());
        }

        return new TravelPlanDto(
                visit.id(),
                visit.orderOfPlan(),
                visit.place().id(),
                visitedOn
        );
    }

}
