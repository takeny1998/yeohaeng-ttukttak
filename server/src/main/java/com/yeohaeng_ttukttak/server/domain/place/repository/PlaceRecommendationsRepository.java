package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.querydsl.jpa.JPAExpressions.select;
import static com.querydsl.jpa.JPAExpressions.selectDistinct;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategory.placeCategory;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravel.travel;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCompanion.travelCompanion;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelMotivation.travelMotivation;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelVisit.travelVisit;

@Slf4j
@Repository
@RequiredArgsConstructor
public class PlaceRecommendationsRepository {

    private final JPAQueryFactory queryFactory;

    public PageResult<Place> call(PlaceCategoryType categoryType,
                            int codeStart, int codeEnd,
                            List<TravelMotivationType> motivationTypes,
                            List<TravelCompanionType> companionTypes,
                            PageCommand pageCommand) {

        NumberExpression<Long> matchedMotivationType = new CaseBuilder()
                .when(travelMotivation.type.in(motivationTypes))
                .then(travelMotivation.type)
                .otherwise(Expressions.nullExpression())
                .countDistinct();

        NumberExpression<Long> matchedCompanionType = new CaseBuilder()
                .when(travelCompanion.type.in(companionTypes))
                .then(travelCompanion.type)
                .otherwise(Expressions.nullExpression())
                .countDistinct();

        JPAQuery<Place> query = queryFactory.selectFrom(place)
                .join(place.categories, placeCategory)
                .join(place.visits, travelVisit)
                .join(travelVisit.travel, travel)
                .leftJoin(travel.motivations, travelMotivation)
                .leftJoin(travel.companions, travelCompanion)
                .where(inRegion(codeStart, codeEnd),
                        placeCategory.type.eq(categoryType),
                        getPrimaryType().eq(placeCategory.count))
                .groupBy(place)
                .orderBy(matchedMotivationType.add(matchedCompanionType).desc(), travelVisit.countDistinct().desc(), place.id.asc());

        return PageUtil.pageBy(query, pageCommand);
    }

    private JPQLQuery<Integer> getPrimaryType() {
        return select(placeCategory.count.max())
                .from(placeCategory)
                .where(placeCategory.place.eq(place));
    }

    private BooleanExpression inRegion(int codeStart, int codeEnd) {
        return place.regionCode.between(codeStart, codeEnd);
    }
}
