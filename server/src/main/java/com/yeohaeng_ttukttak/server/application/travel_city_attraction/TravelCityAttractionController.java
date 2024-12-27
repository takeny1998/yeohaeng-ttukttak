package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.MathExpressions;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogue.travelogue;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueVisit.travelogueVisit;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/cities/{cityId}/attractions")
@RequiredArgsConstructor
public class TravelCityAttractionController {

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;
    private final TravelCityAttractionRepository repository;

    @GetMapping
    public void recommend(
            @PathVariable Long travelId,
            @PathVariable Long cityId) {

        Travel travel = travelRepository.findById(travelId).get();

        Geography city = geographyRepository.findById(cityId).get();

        repository.recommend(travel, city);

    }

}
