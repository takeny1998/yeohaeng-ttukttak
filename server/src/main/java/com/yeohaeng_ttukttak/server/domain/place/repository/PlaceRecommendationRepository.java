package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlace;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategoryMapping;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.querydsl.jpa.JPAExpressions.selectFrom;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravel.travel;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCompanion.travelCompanion;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelMotivation.travelMotivation;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelVisit.travelVisit;

@Repository
@RequiredArgsConstructor
public class PlaceRecommendationRepository {

    private final JPAQueryFactory queryFactory;

    public List<Place> find(PlaceCategory category, int codeStart, int codeEnd, Motivation motivation, CompanionType companionType) {

        QPlaceCategoryMapping pc = new QPlaceCategoryMapping("pc");

        return queryFactory.selectFrom(place)
                .join(travelVisit).on(travelVisit.place.eq(place))
                .join(travel).on(travelVisit.travel.eq(travel))
                .where(
                        place.regionCode.between(codeStart, codeEnd),
                        existsCategory(category, pc),
                        existsMotivation(motivation),
                        existsCompanionType(companionType))
                .fetch();
    }

    private BooleanExpression existsCategory(PlaceCategory category, QPlaceCategoryMapping pc) {
        return selectFrom(pc)
                .where(pc.place.eq(place), pc.category.eq(category))
                .exists();
    }

    private BooleanExpression existsMotivation(Motivation motivation) {
        return motivation != null ?
                selectFrom(travelMotivation)
                        .where(travelMotivation.travel.eq(travel),
                                travelMotivation.motivation.eq(motivation))
                        .exists() : null;
    }

    private BooleanExpression existsCompanionType(CompanionType companionType) {
        return companionType != null ?
                selectFrom(travelCompanion)
                        .where(travelCompanion.travel.eq(travel),
                                travelCompanion.type.eq(companionType))
                        .exists() : null;
    }

}
