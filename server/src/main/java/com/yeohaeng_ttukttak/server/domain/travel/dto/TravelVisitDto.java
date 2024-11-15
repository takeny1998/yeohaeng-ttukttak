package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.image.dto.ImageDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisitReasonType;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Slf4j
public record TravelVisitDto(
        Long id,
        Integer orderOfVisit,
        Long placeId,
        LocalDate visitedOn,
        TravelVisitReasonType reasonType,
        VisitRating rating,
        List<ImageDto> images) {

    public record VisitRating (
            Integer satisfaction,
            Integer revisit,
            Integer recommend) {}

    public static TravelVisitDto of(TravelVisit visit) {

        LocalDate visitedOn = null;

        log.debug("dayOfTravel = {}", visit.dayOfTravel());

        if (visit.dayOfTravel() != null ) {
            visitedOn = visit.travel()
                    .startedOn()
                    .plusDays(visit.dayOfTravel());
        }

        return new TravelVisitDto(
                visit.id(),
                visit.orderOfVisit(),
                visit.place().id(),
                visitedOn,
                visit.reasonType(),
                new VisitRating(
                        visit.satisfaction(),
                        visit.revisit(),
                        visit.recommend()),
                visit.images().stream()
                        .map(ImageDto::of).toList()
        );
    }

}
