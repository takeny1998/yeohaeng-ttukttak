package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravel.travel;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCity.travelCity;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCompanion.travelCompanion;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelMotivation.travelMotivation;

@Slf4j
@Repository
@RequiredArgsConstructor
public class TravelRecommendRepository {

    private final JPAQueryFactory queryFactory;

    public PageResult<Travel> call(Long cityId, List<TravelMotivationType> motivationTypes, List<TravelCompanionType> companionTypes, PageCommand pageCommand) {

        final boolean isMotivationsExists = motivationTypes != null && !motivationTypes.isEmpty();
        final boolean isCompanionTypesExists = companionTypes != null && !companionTypes.isEmpty();

        JPAQuery<Travel> query = queryFactory
                .select(travel)
                .from(travel)
                .where(isMatchedTravel(cityId),
                        travelMotivation.type.in(motivationTypes))
                .groupBy(travel);

        if (isMotivationsExists) {
            query.join(travel.motivations, travelMotivation)
                    .where(travelMotivation.type.in(motivationTypes))
                    .orderBy(travelMotivation.type.countDistinct().desc());
        }

        if (isCompanionTypesExists) {
            query.join(travel.companions, travelCompanion)
                    .where(travelCompanion.type.in(companionTypes))
                    .orderBy(travelCompanion.type.countDistinct().desc());
        }

        if (isMotivationsExists) {
            query.orderBy(travelMotivation.count().desc());
        }

        if (isCompanionTypesExists) {
            query.orderBy(travelCompanion.count().desc());
        }

        return PageUtil.pageBy(query.orderBy(travel.id.asc()), pageCommand);

    }

    private BooleanExpression isMatchedTravel(Long cityId) {
        BooleanExpression matchedCityExists = queryFactory.selectFrom(travelCity)
                .where(travelCity.travel.eq(travel), travelCity.city.id.eq(cityId))
                .exists();

        return travel.instanceOf(InitialTravel.class).and(matchedCityExists);
    }

}
