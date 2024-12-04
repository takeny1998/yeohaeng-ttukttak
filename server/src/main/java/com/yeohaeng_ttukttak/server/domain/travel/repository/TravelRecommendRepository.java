package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
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

    public PageResult<Travel> call(Long cityId, List<MotivationType> motivationTypes, List<CompanionType> companionTypes, PageCommand pageCommand) {

        final JPAQuery<Travel> query = queryFactory
                .select(travel)
                .from(travel)
                .join(travel.motivations, travelMotivation)
                .join(travel.companions, travelCompanion)
                .where(isMatchedTravel(cityId),
                        travelMotivation.type.in(motivationTypes),
                        travelCompanion.type.in(companionTypes))
                .groupBy(travel)
                .orderBy(travelMotivation.count().desc(),
                        travelCompanion.count().desc(),
                        travel.id.asc());

        return PageUtil.pageBy(query, pageCommand);

    }

    private BooleanExpression isMatchedTravel(Long cityId) {
        return queryFactory.selectFrom(travelCity)
                .where(travelCity.travel.eq(travel), travelCity.city.id.eq(cityId))
                .exists();
    }

}
