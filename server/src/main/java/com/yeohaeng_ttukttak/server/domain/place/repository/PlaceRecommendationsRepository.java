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

    public PageResult<Place> byMotivationOrderByRatio(PlaceCategoryType category, int codeStart, int codeEnd, Motivation motivation, PageCommand comm) {
        NumberExpression<Double> ratioExpression = createTargetRatioExpression(
                travelMotivation.motivation.eq(motivation),
                travelMotivation.motivation.count());

        JPAQuery<Place> query = createBaseQuery(codeStart, codeEnd, category)
                .join(travelMotivation).on(travelMotivation.travel.eq(travel));

        return PageUtil.pageBy(orderByRatio(ratioExpression, category, query), comm);
    }

    public PageResult<Place> byCompanionTypeOrderByRatio(PlaceCategoryType category, int codeStart, int codeEnd, CompanionType companionType, PageCommand comm) {
        NumberExpression<Double> targetRatioExpression = createTargetRatioExpression(
                travelCompanion.type.eq(companionType),
                travelCompanion.type.count());

        JPAQuery<Place> query = createBaseQuery(codeStart, codeEnd, category)
                .join(travelCompanion).on(travelCompanion.travel.eq(travel));

        return PageUtil.pageBy(orderByRatio(targetRatioExpression, category, query), comm);
    }

    private JPAQuery<Place> orderByRatio(NumberExpression<Double> targetRatioExpression, PlaceCategoryType category, JPAQuery<Place> query) {

        return query
                .having(targetRatioExpression.gt(0.0))
                .orderBy(targetRatioExpression.desc(), place.id.asc());
    }

    private JPAQuery<Place> createBaseQuery(int codeStart, int codeEnd, PlaceCategoryType categoryType) {
        return queryFactory
                .selectFrom(place)
                .leftJoin(place.visits, travelVisit)
                .leftJoin(travelVisit.travel, travel)
                .leftJoin(place.categories, placeCategory)
                .where(inRegion(codeStart, codeEnd),
                        placeCategory.type.eq(categoryType),
                        getPrimaryType().eq(placeCategory.count))
                .groupBy(place);
    }

    private JPQLQuery<Integer> getPrimaryType() {
        return select(placeCategory.count.max())
                .from(placeCategory)
                .where(placeCategory.place.eq(place));
    }

    private NumberExpression<Double> createTargetRatioExpression(BooleanExpression eq, NumberExpression<Long> count) {
        return new CaseBuilder()
                .when(eq)
                .then(travelVisit.satisfaction
                        .add(travelVisit.revisit)
                        .add(travelVisit.recommend)
                        .castToNum(Double.class))
                .otherwise(0.0)
                .sum()
                .divide(2.0); // 방문 수 33.0 % 반영
    }

    private BooleanExpression inRegion(int codeStart, int codeEnd) {
        return place.regionCode.between(codeStart, codeEnd);
    }
}
