package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategoryMapping;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
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

    public List<Place> recommendByMotivation(PlaceCategory category, int codeStart, int codeEnd, Motivation motivation) {
        NumberExpression<Double> ratioExpression = createRatioExpression(
                travelMotivation.motivation.eq(motivation),
                travelMotivation.motivation.count());

        return createBaseQuery(ratioExpression, codeStart, codeEnd, category)
                .join(travelMotivation).on(travelMotivation.travel.eq(travel))
                .fetch();
    }

    public List<Place> recommendByCompanionType(PlaceCategory category, int codeStart, int codeEnd, CompanionType companionType) {
        NumberExpression<Double> ratioExpression = createRatioExpression(
                travelCompanion.type.eq(companionType),
                travelCompanion.type.count());

        return createBaseQuery(ratioExpression, codeStart, codeEnd, category)
                .join(travelCompanion).on(travelCompanion.travel.eq(travel))
                .fetch();
    }

    private JPAQuery<Place> createBaseQuery(NumberExpression<Double> ratioExpression, int codeStart, int codeEnd, PlaceCategory category) {
        return queryFactory
                .selectFrom(place)
                .join(travelVisit).on(travelVisit.place.eq(place))
                .join(travel).on(travelVisit.travel.eq(travel))
                .where(inRegion(codeStart, codeEnd), existsCategory(category))
                .groupBy(place)
                .having(ratioExpression.gt(0.0))
                .orderBy(ratioExpression.desc(), place.id.asc());
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
