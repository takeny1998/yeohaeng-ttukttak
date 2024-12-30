package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategory;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanion;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelMotivation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.stream.Collectors;

import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlaceCategory.placeCategory;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogue.travelogue;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueCompanion.travelogueCompanion;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueMotivation.travelogueMotivation;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogueVisit.travelogueVisit;

@Repository
@Slf4j
@RequiredArgsConstructor
public class TravelCityAttractionRepository {

    private final JPAQueryFactory queryFactory;
    private static final double C = 5.0;

    public List<Tuple> recommend(Travel travel, City city) {
        NumberExpression<Double> ratingExpr = createRatingExpr(travel);
        double avgRating = calEntireRatingAverage(ratingExpr);
        NumberExpression<Long> countExpr = travelogueVisit.countDistinct();
        NumberExpression<Double> bayesianAvgExpr = calculateBayesianAvg(avgRating, ratingExpr.multiply(countExpr), countExpr);

        return queryFactory.select(place.id, place.name, countExpr, ratingExpr, bayesianAvgExpr)
                .from(place)
                .join(place.categories, placeCategory)
                .join(place.visits, travelogueVisit)
                .join(travelogueVisit.travelogue, travelogue)
                .join(travelogue.companions, travelogueCompanion)
                .join(travelogue.motivations, travelogueMotivation)
                .where(placeCategory.type.in(PlaceCategoryType.thingsToDo()), isInGeography(city))
                .groupBy(place)
                .orderBy(bayesianAvgExpr.desc(), place.id.asc())
                .fetch();
    }

    private NumberExpression<Double> createRatingExpr(Travel travel) {
        return calculateMemberSimilarity(travel)
                .add(calculateMotivationSimilarity(travel))
                .divide(2.0);
    }

    private NumberExpression<Double> calculateMemberSimilarity(Travel travel) {
        return compareWithCompanionTypes(travel).add(compareProfiles(travel)).divide(2.0);
    }

    private NumberExpression<Double> calculateMotivationSimilarity(Travel travel) {
        List<MotivationType> motivationTypes = travel.motivations().stream()
                .map(TravelMotivation::type).collect(Collectors.toList());

        return calculateSimilarity(travelogueMotivation.type, motivationTypes);
    }

    private NumberExpression<Double> compareWithCompanionTypes(Travel travel) {
        List<CompanionType> companionTypes = travel.companions().stream()
                .map(TravelCompanion::type).collect(Collectors.toList());

        return calculateSimilarity(travelogueCompanion.type, companionTypes);
    }

    private <T extends Enum<T>> NumberExpression<Double> calculateSimilarity(EnumPath<T> typeExpr, List<T> types) {
        NumberExpression<Long> intersectCountExpr = new CaseBuilder()
                .when(typeExpr.in(types))
                .then(typeExpr)
                .otherwise(Expressions.nullExpression())
                .countDistinct();

        NumberExpression<Long> unionCountExpr = typeExpr.countDistinct().add(types.size());
        return intersectCountExpr.divide(unionCountExpr).doubleValue();
    }

    private double calEntireRatingAverage(NumberExpression<Double> ratingExpr) {
        return queryFactory.select(ratingExpr)
                .from(travelogue)
                .join(travelogue.companions, travelogueCompanion)
                .join(travelogue.motivations, travelogueMotivation)
                .fetch()
                .stream()
                .collect(Collectors.averagingDouble(Double::doubleValue));
    }

    private NumberExpression<Double> calculateBayesianAvg(double entireAvg, NumberExpression<Double> avgExpr, NumberExpression<Long> countExpr) {
        return add(avgExpr, multiply(C, entireAvg)).divide(countExpr.add(C));
    }

    private NumberExpression<Double> compareProfiles(Travel travel) {
        return abs(sqrt(add(squared(abs(subtract(travelogue.statistics.ageGroupAvg.avg(), travel.statistics().ageGroupAvg()))),
                squared(abs(subtract(travelogue.statistics.genderAvg.avg(), travel.statistics().genderAvg())))))
                .subtract(1.0));
    }

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