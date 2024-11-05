package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.image.dto.ImageDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisitReasonType;

import java.time.LocalDate;
import java.util.List;

public record TravelVisitDto(
        Long id,
        Integer seq,
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
        return new TravelVisitDto(
                visit.id(),
                visit.seq(),
                visit.place().id(),
                visit.visitedOn(),
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
