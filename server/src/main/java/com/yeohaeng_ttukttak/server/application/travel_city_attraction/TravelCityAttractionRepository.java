package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogue.travelogue;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueCompanion.travelogueCompanion;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueMotivation.travelogueMotivation;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueVisit.travelogueVisit;

@Repository
@Slf4j
@RequiredArgsConstructor
public class TravelCityAttractionRepository {

    private final JPAQueryFactory queryFactory;

    /**
     * 여행 선호도와 지리적 데이터를 기반으로 명소를 추천합니다.
     *
     * @param travel 사용자의 여행 선호도.
     * @param city 추천을 위한 지리적 제약.
     */
    public void recommend(Travel travel, City city) {

        final NumberExpression<Double> distExpr = calEuclideanDistance(travel);

        final Double entireDistAvg = calEntireDistanceAvg(travel);

        final NumberExpression<Double> bayesianDistAvgExpr =
                calBayesianAvg(entireDistAvg, distExpr.sum(), travelogue.count());

        List<Tuple> result = queryFactory.select(place, bayesianDistAvgExpr, distExpr.avg(), travelogue.count(), travelogue.countDistinct())
                .from(place)
                .join(place.visits, travelogueVisit)
                .join(travelogueVisit.travelogue, travelogue)
                .leftJoin(travelogue.companions, travelogueCompanion)
                .leftJoin(travelogue.motivations, travelogueMotivation)
                .where(isInGeography(city))
                .orderBy(bayesianDistAvgExpr.desc())
                .groupBy(place)
                .fetch();

        for (Tuple tuple : result) {
            System.out.println("name=" + tuple.get(0, Place.class).name()
                    + " bayesianAvg=" + tuple.get(1, Double.class)
                    + " distance=" + tuple.get(2, Double.class)
                    + " count=" + tuple.get(3, Integer.class)
                    + " countDistinct=" + tuple.get(4, Integer.class));
        }
    }

    private Double calEntireDistanceAvg(Travel travel) {
        return queryFactory
                .select(calEuclideanDistance(travel).avg())
                .from(travelogue)
                .fetchOne();
    }

    private NumberExpression<Double> calBayesianAvg(Double entireAvg,
                                                    NumberExpression<Double> avgExpr,
                                                    NumberExpression<Long> countExpr) {
        final double C = 2.0;
        return add(avgExpr, multiply(C, entireAvg))
                .divide(countExpr.add(C));
    }


    private NumberExpression<Double> calEuclideanDistance(Travel travel) {
        return sqrt(add(squared(abs(subtract(travelogue.statistics.ageGroupAvg, travel.statistics().ageGroupAvg()))),
                squared(abs(subtract(travelogue.statistics.genderAvg, travel.statistics().genderAvg())))));
    }

    /**
     * 지정된 지역 내에 장소가 있는지 확인합니다.
     */
    private BooleanExpression isInGeography(Geography geography) {
        return place.regionCode.between(geography.codeStart(), geography.codeEnd());
    }

    private NumberExpression<Double> squared(Object argument) {
        return Expressions.numberTemplate(Double.class, "POWER({0}, 2)", argument);
    }

    private NumberExpression<Double> sqrt(Object argument) {
        return Expressions.numberTemplate(Double.class, "SQRT({0})", argument);
    }

    private NumberExpression<Double> add(Object left, Object right) {
        return Expressions.numberTemplate(Double.class, "({0} + {1})", left, right);
    }

    private NumberExpression<Double> abs(Object argument) {
        return Expressions.numberTemplate(Double.class, "ABS({0})", argument);
    }

    private NumberExpression<Double> subtract(Object left, Object right) {
        return Expressions.numberTemplate(Double.class, "({0} - {1})", left, right);
    }


    private NumberExpression<Double> multiply(Object left, Object right) {
        return Expressions.numberTemplate(Double.class, "({0} * {1})", left, right);
    }
}