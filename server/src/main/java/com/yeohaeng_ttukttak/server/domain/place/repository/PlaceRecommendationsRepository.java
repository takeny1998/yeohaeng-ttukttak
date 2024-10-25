package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategoryMapping;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import static com.querydsl.jpa.JPAExpressions.selectFrom;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravel.travel;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelCompanion.travelCompanion;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelMotivation.travelMotivation;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelVisit.travelVisit;

@Repository
@RequiredArgsConstructor
public class PlaceRecommendationsRepository {

    private final JPAQueryFactory queryFactory;

    public PageResult<Place> byMotivationOrderByRatio(PlaceCategory category, int codeStart, int codeEnd, Motivation motivation, PageCommand comm) {
        NumberExpression<Double> ratioExpression = createRatioExpression(
                travelMotivation.motivation.eq(motivation),
                travelMotivation.motivation.count());

        JPAQuery<Place> query = createBaseQuery(codeStart, codeEnd, category)
                .join(travelMotivation).on(travelMotivation.travel.eq(travel));

        return PageUtil.pageBy(orderByRatio(ratioExpression, query), comm);
    }

    public PageResult<Place> byCompanionTypeOrderByRatio(PlaceCategory category, int codeStart, int codeEnd, CompanionType companionType, PageCommand comm) {
        NumberExpression<Double> ratioExpression = createRatioExpression(
                travelCompanion.type.eq(companionType),
                travelCompanion.type.count());

        JPAQuery<Place> query = createBaseQuery(codeStart, codeEnd, category)
                .join(travelCompanion).on(travelCompanion.travel.eq(travel));

        return PageUtil.pageBy(orderByRatio(ratioExpression, query), comm);
    }

    private JPAQuery<Place> orderByRatio(NumberExpression<Double> ratioExpression, JPAQuery<Place> query) {
        return query
                .having(ratioExpression.gt(0.0))
                .orderBy(ratioExpression.desc(), place.id.asc());
    }

    private JPAQuery<Place> createBaseQuery(int codeStart, int codeEnd, PlaceCategory category) {
        return queryFactory
                .selectFrom(place)
                .join(travelVisit).on(travelVisit.place.eq(place))
                .join(travel).on(travelVisit.travel.eq(travel))
                .where(inRegion(codeStart, codeEnd), existsCategory(category))
                .groupBy(place);
    }

    private NumberExpression<Double> createRatioExpression(BooleanExpression eq, NumberExpression<Long> count) {
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

    private BooleanExpression existsCategory(PlaceCategory category) {
        QPlaceCategoryMapping pc = new QPlaceCategoryMapping("pc");
        return selectFrom(pc)
                .where(pc.place.eq(place), pc.category.eq(category))
                .exists();
    }
}
