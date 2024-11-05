package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceMetricsDto;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceSortType;
import com.yeohaeng_ttukttak.server.domain.place.dto.QPlaceMetricsDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

import static com.querydsl.core.types.dsl.Expressions.nullExpression;
import static com.querydsl.jpa.JPAExpressions.select;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategory.placeCategory;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelVisit.travelVisit;

@Repository
@RequiredArgsConstructor
public class PlaceCategoryRepository {

    private final JPAQueryFactory queryFactory;

    public PageResult<PlaceMetricsDto> call(PlaceCategoryType categoryType,
                                   int codeStart, int codeEnd,
                                   PlaceSortType sortType,
                                   PageCommand pageCommand) {

        NumberExpression<Long> visitCountExpr = travelVisit.countDistinct();
        JPAQuery<PlaceMetricsDto> query = queryFactory
                .select(new QPlaceMetricsDto(place, nullExpression(), visitCountExpr))
                .from(place)
                .join(place.categories, placeCategory)
                .join(place.visits, travelVisit)
                .where(place.regionCode.between(codeStart, codeEnd),
                        placeCategory.type.eq(categoryType),
                        getPrimaryType().eq(placeCategory.count))
                .groupBy(place);

        if (Objects.requireNonNull(sortType) == PlaceSortType.rating) {
            NumberExpression<Double> ratingExpression = travelVisit
                    .satisfaction.sum()
                    .add(travelVisit.recommend.sum())
                    .add(travelVisit.revisit.sum())
                    .castToNum(Double.class)
                    .divide(3.0)
                    .divide(travelVisit.count().castToNum(Double.class));

            query.select(new QPlaceMetricsDto(place, ratingExpression, visitCountExpr))
                    .orderBy(ratingExpression.desc());
        }

        return PageUtil.pageBy(query.orderBy(visitCountExpr.desc(), place.id.asc()), pageCommand);
    }

    private JPQLQuery<Integer> getPrimaryType() {
        return select(placeCategory.count.max())
                .from(placeCategory)
                .where(placeCategory.place.eq(place));
    }
}
