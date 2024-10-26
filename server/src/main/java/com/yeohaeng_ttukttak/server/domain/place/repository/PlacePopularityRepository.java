package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.CaseBuilder;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.util.PageUtil;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryMapping;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategoryMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import static com.querydsl.jpa.JPAExpressions.selectFrom;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategoryMapping.placeCategoryMapping;
import static com.yeohaeng_ttukttak.server.domain.travel.entity.QTravelVisit.travelVisit;

@Repository
@RequiredArgsConstructor
public class PlacePopularityRepository {

    private final JPAQueryFactory queryFactory;

    public PageResult<Place> byVisit(
            PlaceCategory category, int codeStart, int codeEnd, PageCommand comm) {

        NumberExpression<Double> expression = travelVisit.count()
                .castToNum(Double.class)
                .multiply(createCategoryRatioExpression(category).multiply(0.5));

        JPAQuery<Place> query = queryFactory.select(place)
                .from(place)
                .where(inRegion(codeStart, codeEnd))
                .join(travelVisit).on(travelVisit.place.eq(place))
                .join(placeCategoryMapping).on(placeCategoryMapping.place.eq(place))
                .groupBy(place)
                .having(expression.gt(0.0))
                .orderBy(expression.desc(), place.id.asc());

        return PageUtil.pageBy(query, comm);
    }

    private BooleanExpression inRegion(int codeStart, int codeEnd) {
        return place.regionCode.between(codeStart, codeEnd);
    }

    private NumberExpression<Double> createCategoryRatioExpression(PlaceCategory category) {

        return new CaseBuilder()
                .when(placeCategoryMapping.category.eq(category))
                .then(1.0)
                .otherwise(0.0)
                .sum()
                .divide(placeCategoryMapping.count());
    }
}
