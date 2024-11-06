package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.dto.*;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Objects;

import static com.querydsl.core.types.dsl.Expressions.nullExpression;
import static com.querydsl.jpa.JPAExpressions.select;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategory.placeCategory;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelVisit.travelVisit;

@Slf4j
@Repository
@RequiredArgsConstructor
public class PlacePoiRepository {

    private final JPAQueryFactory queryFactory;

    public PageResult<PlaceMetricRecord> call(
                                   int codeStart, int codeEnd,
                                   PlaceSortType sortType,
                                   PageCommand pageCommand) {

        NumberExpression<Long> visitCountExpr = travelVisit.countDistinct();
        
        BooleanExpression booleanExpression =
                place.regionCode.between(codeStart, codeEnd)
                        .and(equalsPrimaryType())
                        .and(placeCategory.type.in(PlaceCategoryType.thingsToDo()));
        
        JPAQuery<PlaceMetricRecord> query = queryFactory
                .select(new QPlaceMetricRecord(place, nullExpression(), visitCountExpr))
                .from(place)
                .join(place.categories, placeCategory)
                .join(place.visits, travelVisit)
                .where(booleanExpression)
                .groupBy(place);

        if (Objects.requireNonNull(sortType) == PlaceSortType.rating) {

            NumberExpression<Double> ratingExpression =
                    calculateBayesianAvg(booleanExpression);

            query.select(new QPlaceMetricRecord(place, ratingExpression, visitCountExpr))
                    .orderBy(ratingExpression.desc());
        }

        return PageUtil.pageBy(
                query.orderBy(visitCountExpr.desc(), place.id.asc()), pageCommand);
    }

    private NumberExpression<Double> calculateBayesianAvg(BooleanExpression booleanExpression) {
        final Double entireAvgExpr = queryFactory.select(
                        travelVisit.satisfaction.avg()
                                .add(travelVisit.recommend.avg())
                                .add(travelVisit.revisit.avg())
                                .divide(3.0))
                .from(place)
                .join(place.categories, placeCategory)
                .join(place.visits, travelVisit)
                .where(booleanExpression)
                .fetchOne();

        final Double C = 5.0;

        NumberExpression<Double> ratingSumExpr = travelVisit.satisfaction.sum()
                .add(travelVisit.recommend.sum())
                .add(travelVisit.revisit.sum())
                .castToNum(Double.class).divide(3.0);

        return ratingSumExpr
                .add(C * entireAvgExpr)
                .divide(travelVisit.count().add(C));
    }

    private BooleanExpression equalsPrimaryType() {
        return select(placeCategory.count.max())
                .from(placeCategory)
                .where(placeCategory.place.eq(place))
                .eq(placeCategory.count);
    }
}
