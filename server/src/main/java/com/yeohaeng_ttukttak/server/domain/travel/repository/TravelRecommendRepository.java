package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.querydsl.jpa.JPAExpressions.select;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravel.travel;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCity.travelCity;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCompanion.travelCompanion;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelMotivation.travelMotivation;

@Repository
@RequiredArgsConstructor
public class TravelRecommendRepository {

    private final JPAQueryFactory queryFactory;

    public List<Travel> byMotivations(Long cityId, List<Motivation> motivations) {
        return queryFactory
                .selectFrom(travel)
                .join(travel.motivations, travelMotivation)
                .where(isMatchedTravel(cityId),
                        travelMotivation.motivation.in(motivations))
                .groupBy(travel)
                .orderBy(
                        travelMotivation.motivation.countDistinct().desc(),
                        travelMotivation.count().desc(),
                        travel.id.asc())
                .fetch();
    }

    public List<Travel> byCompanionTypes(Long cityId, List<CompanionType> companionTypes) {
        return queryFactory
                .selectFrom(travel)
                .join(travel.companions, travelCompanion)
                .where(isMatchedTravel(cityId),
                        travelCompanion.type.in(companionTypes))
        .groupBy(travel)
        .orderBy(
                travelCompanion.type.countDistinct().desc(),
                travelCompanion.count().desc(),
                travel.id.asc())
        .fetch();
    }

    private BooleanExpression isMatchedTravel(Long cityId) {
        BooleanExpression matchedCityExists = queryFactory.selectFrom(travelCity)
                .where(travelCity.travel.eq(travel), travelCity.city.id.eq(cityId))
                .exists();

        return travel.instanceOf(InitialTravel.class).and(matchedCityExists);
    }

}
