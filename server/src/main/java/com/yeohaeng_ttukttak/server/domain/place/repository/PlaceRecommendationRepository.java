package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.Expression;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlace;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategoryMapping;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.querydsl.jpa.JPAExpressions.select;
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

    public List<Tuple> recommendByMotivation(PlaceCategory category, int codeStart, int codeEnd, Motivation motivation) {

        NumberPath<Long> matchedCount = Expressions.numberPath(Long.class, "matchedCount");

        return queryFactory.
                select(place, travelMotivation.count().as(matchedCount))
                .from(place)
                .join(travelVisit).on(travelVisit.place.eq(place))
                .join(travel).on(travelVisit.travel.eq(travel))
                .join(travelMotivation).on(travelMotivation.travel.eq(travel))
                .where(inRegion(codeStart, codeEnd), existsCategory(category), travelMotivation.motivation.eq(motivation))
                .groupBy(place, travelMotivation.motivation)
                .orderBy(matchedCount.desc(), place.id.asc())
                .fetch();
    }

    private BooleanExpression inRegion(int codeStart, int codeEnd) {
        return place.regionCode.between(codeStart, codeEnd);
    }

    private BooleanExpression existsCategory(PlaceCategory category) {
        QPlaceCategoryMapping pc = new QPlaceCategoryMapping("pc");

        return select()
                .from(pc)
                .where(pc.place.eq(place), pc.category.eq(category))
                .exists();

    }
}
