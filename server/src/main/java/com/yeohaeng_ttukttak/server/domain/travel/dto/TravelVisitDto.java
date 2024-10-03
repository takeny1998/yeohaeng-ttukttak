package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.entity.VisitReason;

import java.time.LocalDate;

public record TravelVisitDto(
        Long id,
        Integer seq,
        Long placeId,
        LocalDate visitedOn,
        VisitReason reason,
        VisitRating rating) {

    public record VisitRating (
            Integer satisfaction,
            Integer revisit,
            Integer recommend) {}

    public static TravelVisitDto of(TravelVisit visit) {
        return new TravelVisitDto(
                visit.id(),
                visit.seq(),
                visit.place().id(),
                visit.visitedOn(),
                visit.reason(),
                new VisitRating(
                        visit.satisfaction(),
                        visit.revisit(),
                        visit.recommend())
        );
    }

}
