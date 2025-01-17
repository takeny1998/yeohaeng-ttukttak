package com.yeohaeng_ttukttak.server.domain.travel_city_attraction;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.VisitReasonType;
import com.yeohaeng_ttukttak.server.domain.travelogue.entity.TravelogueVisit;

import java.util.List;
import java.util.Map.Entry;

import static java.util.Comparator.comparingLong;
import static java.util.stream.Collectors.counting;
import static java.util.stream.Collectors.groupingBy;

public record AttractionDto(
        Long id,
        String name,
        String roadAddress,
        String lotNumberAddress,
        Double rating,
        List<PlaceCategoryType> categoryTypes,
        List<AttractionVisitReasonDto> visitReasons
) {

    public record AttractionVisitReasonDto(
            VisitReasonType reasonType, Long count) {

        public static AttractionVisitReasonDto of (Entry<VisitReasonType, Long> entry) {
            return new AttractionVisitReasonDto(entry.getKey(), entry.getValue());
        }

    }

    public static AttractionDto of(Place place, Double satisfaction) {
        final List<AttractionVisitReasonDto> visitReasons = place.visits().stream()
                .collect(groupingBy(TravelogueVisit::reasonType, counting()))
                .entrySet()
                .stream().map(AttractionVisitReasonDto::of)
                .sorted(comparingLong(AttractionVisitReasonDto::count).reversed())
                .toList();

        return new AttractionDto(place.id(),
            place.name(),
            place.roadAddress(),
            place.lotNumberAddress(),
            satisfaction,
            place.categories().stream()
                    .map(PlaceCategory::type).distinct().toList(),
                visitReasons
        );
    }

}
