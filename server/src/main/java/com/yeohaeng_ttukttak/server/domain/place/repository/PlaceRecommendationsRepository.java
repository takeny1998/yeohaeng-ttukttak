package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategory;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

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

        NumberExpression<Double> categoryRatioExpression = createCategoryRatioExpression(category);

        NumberExpression<Double> ratioExpression = targetRatioExpression.multiply(categoryRatioExpression.multiply(0.5));
        return query
                .having(ratioExpression.gt(0.0))
                .orderBy(ratioExpression.desc(), place.id.asc());
    }

    private JPAQuery<Place> createBaseQuery(int codeStart, int codeEnd, PlaceCategoryType category) {


        return queryFactory
                .selectFrom(place)
                .join(travelVisit).on(travelVisit.place.eq(place))
                .join(travel).on(travelVisit.travel.eq(travel))
                .join(placeCategory).on(placeCategory.place.eq(place))
                .where(inRegion(codeStart, codeEnd))
                .groupBy(place);
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
                .divide(count);
    }

    private BooleanExpression inRegion(int codeStart, int codeEnd) {
        return place.regionCode.between(codeStart, codeEnd);
    }

    private NumberExpression<Double> createCategoryRatioExpression(PlaceCategoryType category) {


        return new CaseBuilder()
                .when(placeCategory.type.eq(category))
                .then(1.0)
                .otherwise(0.0)
                .sum()
                .divide(placeCategory.count());
    }
}
