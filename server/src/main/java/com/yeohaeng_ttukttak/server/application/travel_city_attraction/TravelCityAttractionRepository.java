package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollCommand;
import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollResult;
import com.yeohaeng_ttukttak.server.common.dto.JpaInfiniteScrollResult;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.interfaces.EnumNormalizable;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanion;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelMotivation;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import com.yeohaeng_ttukttak.server.domain.travel_city_attraction.AttractionDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

    public InfiniteScrollResult<AttractionDto> orderByTravelSimilarity(InfiniteScrollCommand command, Travel travel, City city) {

        final NumberExpression<Double> similarityExpr = calculateMemberSimilarity(travel)
                .add(calculateMotivationSimilarity(travel))
                .divide(2.0);

        final double entireSimilarityAvg = queryFactory.select(similarityExpr)
                .from(travelogue)
                .join(travelogue.companions, travelogueCompanion)
                .join(travelogue.motivations, travelogueMotivation)
                .groupBy(travelogue)
                .fetch().stream().collect(Collectors.averagingDouble(Double::doubleValue));

        final NumberExpression<Long> countExpr = travelogueVisit.countDistinct();

        final NumberExpression<Double> bayesianAvgExpr =
                calculateBayesianAvg(entireSimilarityAvg, similarityExpr.multiply(countExpr), countExpr);

        final NumberExpression<Double> ratingAvgExpr = travelogueVisit.satisfaction.avg();
        final Double entireRatingAvg = queryFactory.select(ratingAvgExpr)
                .from(travelogueVisit)
                .fetchOne();

        log.debug("avg={}", entireRatingAvg);

        final NumberExpression<Double> ratingSumExpr =
                travelogueVisit.satisfaction.sum().castToNum(Double.class);

        final JPQLQuery<Double> bayesianRatingSubQuery = JPAExpressions
                .select(calculateBayesianAvg(entireRatingAvg, ratingSumExpr, travelogueVisit.count()))
                .from(travelogueVisit)
                .where(travelogueVisit.place.eq(place));

        final JPAQuery<AttractionQueryDto> query = queryFactory.select(
                new QAttractionQueryDto(place, bayesianRatingSubQuery))
                .from(place)
                .join(place.categories, placeCategory)
                .join(place.visits, travelogueVisit)
                .join(travelogueVisit.travelogue, travelogue)
                .join(travelogue.companions, travelogueCompanion)
                .join(travelogue.motivations, travelogueMotivation)
                .where(placeCategory.type.in(PlaceCategoryType.thingsToDo()), isInGeography(city))
                .groupBy(place)
                .orderBy(bayesianAvgExpr.desc(), place.id.asc());

        return new JpaInfiniteScrollResult<AttractionQueryDto, AttractionDto>(command, query, AttractionQueryDto::toEntityDto);
    }



    private NumberExpression<Double> calculateMemberSimilarity(Travel travel) {

        final NumberExpression<Integer> numOfParticipantSumExpr = travelogue.numberOfParticipant.sum();

        final NumberExpression<Double> p1 = travelogue.ageGroupSum.sum().divide(numOfParticipantSumExpr);
        final NumberExpression<Double> p2 = travelogue.genderSum.sum().divide(numOfParticipantSumExpr);

        final List<Member> members = Stream.concat(
                travel.participants().stream().map(TravelParticipant::invitee),
                Stream.of(travel.createdBy())
                ).toList();

        final NumberExpression<Double> q1 = avgNormalizeValues(members, Member::ageGroup);
        final NumberExpression<Double> q2 = avgNormalizeValues(members, Member::gender);

        // R(dist) = ABS(dist - 1)
        final NumberExpression<Double> rating = calEuclideanDistance(p1, p2, q1, q2).subtract(1.0).abs();

        return compareWithCompanionTypes(travel).add(rating).divide(2.0);
    }

    private NumberExpression<Double> avgNormalizeValues(List<Member> members, Function<Member, EnumNormalizable> mapper) {
        return Expressions.asNumber(
                members.stream()
                        .map(mapper)
                        .mapToDouble(EnumNormalizable::normalize)
                        .sum()).divide(members.size());
    }

    private NumberExpression<Double> calculateMotivationSimilarity(Travel travel) {
        List<MotivationType> motivationTypes = travel.motivations().stream()
                .map(TravelMotivation::type).collect(Collectors.toList());

        return calJaccardSimilarity(travelogueMotivation.type, motivationTypes);
    }

    private NumberExpression<Double> compareWithCompanionTypes(Travel travel) {
        List<CompanionType> companionTypes = travel.companions().stream()
                .map(TravelCompanion::type).collect(Collectors.toList());

        return calJaccardSimilarity(travelogueCompanion.type, companionTypes);
    }

    /**
     * 두 Enum 집합 A, B의 자카드 지수를 계산해 반환합니다.
     *
     * <p>
     * J(A, B) = &frac{|A ∩ B|}{|A ∪ B|
     * </p>
     *
     * @param elementTypeExpr 집합 A의 원소를 나타내는 표현식
     * @param types 집합 B의 원소 목록
     * @return 0부터 1 사이의 일반화된 유사도
     * @param <T> Enum 원소 타입
     */
    private <T extends Enum<T>> NumberExpression<Double> calJaccardSimilarity(EnumPath<T> elementTypeExpr, List<T> types) {
        NumberExpression<Long> intersectCountExpr = new CaseBuilder()
                .when(elementTypeExpr.in(types))
                .then(elementTypeExpr)
                .otherwise(Expressions.nullExpression())
                .countDistinct();

        NumberExpression<Long> unionCountExpr = intersectCountExpr.add(types.size());
        return intersectCountExpr.divide(unionCountExpr).doubleValue();
    }

    /**
     * 베이지안 평균을 계산해 반환합니다.
     *
     * <p>
     * 베이지안 평균은 전체 평균과 데이터의 평균을 바탕으로 가중치를 두어 계산됩니다.
     * <br>
     * Bayesian Avg = &frac{(C &times; 전체 평균) + 평균값}{C + 데이터 개수}
     * </p>
     *
     * @param entireAverage 전체 평균 값
     * @param averageExpr 데이터의 평균 표현식
     * @param countExpr 데이터의 개수 표현식
     * @return 계산된 베이지안 평균
     */
    private NumberExpression<Double> calculateBayesianAvg(double entireAverage, NumberExpression<Double> averageExpr, NumberExpression<Long> countExpr) {
        NumberExpression<Double> upperHand = Expressions.asNumber(entireAverage * C).add(averageExpr);
        NumberExpression<Long> lowerHand = countExpr.add(C);
        return upperHand.divide(lowerHand);
    }

    /**
     * 두 숫자의 절대 차이의 제곱을 계산해 반환합니다.
     *
     * <p>
     * Absolute Difference Squared = POWER(ABS(a - b), 2)
     * </p>
     *
     * @param a 첫 번째 숫자 표현식
     * @param b 두 번째 숫자 표현식
     * @return 절대 차이의 제곱을 나타내는 표현식
     */
    private NumberExpression<Double> calAbsoluteDifference(NumberExpression<Double> a, NumberExpression<Double> b) {
        return Expressions.numberTemplate(Double.class, "POWER(ABS({0} - {1}), 2)", a, b);
    }

    /**
     * 두 점 (p1, p2)와 (q1, q2) 간의 유클리드 거리를 계산해 반환합니다.
     *
     * <p>
     * Euclidean Distance = SQRT(POWER(ABS(p1 - q1), 2) + POWER(ABS(p2 - q2), 2))
     * </p>
     *
     * @param p1 첫 번째 점의 x좌표 표현식
     * @param p2 첫 번째 점의 y좌표 표현식
     * @param q1 두 번째 점의 x좌표 표현식
     * @param q2 두 번째 점의 y좌표 표현식
     * @return 두 점 간의 유클리드 거리 표현식
     */
    private NumberExpression<Double> calEuclideanDistance(NumberExpression<Double> p1, NumberExpression<Double> p2, NumberExpression<Double> q1, NumberExpression<Double> q2) {
        NumberExpression<Double> leftHand = calAbsoluteDifference(p1, q1);
        NumberExpression<Double> rightHand = calAbsoluteDifference(p2, q2);
        return Expressions.numberTemplate(Double.class, "SQRT({0} + {1})", leftHand, rightHand);
    }

    private BooleanExpression isInGeography(Geography geography) {
        return place.regionCode.between(geography.codeStart(), geography.codeEnd());
    }

}