package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.*;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.yeohaeng_ttukttak.server.domain.place.entity.QPlace.place;
import static com.yeohaeng_ttukttak.server.domain.travelogue.entity.QTravelogue.travelogue;
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
     * @param geography 추천을 위한 지리적 제약.
     */
    public void recommend(Travel travel, Geography geography) {
        final NumberExpression<Double> cosineSimilarity = calculateCosineSimilarity(travel);

        List<Tuple> result = queryFactory.select(place, cosineSimilarity)
                .from(place)
                .join(place.visits, travelogueVisit)
                .join(travelogueVisit.travelogue, travelogue)
                .where(isInGeography(geography))
                .orderBy(cosineSimilarity.desc())
                .limit(10)
                .fetch();

        for (Tuple tuple : result) {
            System.out.println("name=" + tuple.get(0, Place.class).name() + " similarity=" + tuple.get(1, Double.class));
        }
    }

    /**
     * <p>
     * 여행기와 사용자 여행의 코사인 유사도를 계산합니다.
     * <pre>
     * Cosine Similarity = (A · B) / (||A|| * ||B||)
     * </pre>
     *
     * @param travel 사용자의 여행 선호도.
     * @return 코사인 유사도를 나타내는 NumberExpression.
     */
    private NumberExpression<Double> calculateCosineSimilarity(Travel travel) {
        NumberExpression<Double> dotProduct = calculateDotProduct(travel);
        NumberExpression<Double> magnitude = calculateDMagnitude(travel);

        return dotProduct.divide(magnitude);
    }

    /**
     * <p>
     * 통계 벡터의 내적을 계산합니다.
     * <pre>
     * A · B = (A1 * B1) + (A2 * B2)
     * </pre>
     *
     * @param travel 사용자의 여행 선호도.
     * @return 내적을 나타내는 NumberExpression.
     */
    private NumberExpression<Double> calculateDotProduct(Travel travel) {
        return travelogue.statistics.ageGroupAvg.multiply(travel.statistics().ageGroupAvg())
                .add(travelogue.statistics.genderAvg.multiply(travel.statistics().genderAvg()));
    }

    /**
     * <p>
     * 통계 벡터의 크기를 계산합니다.
     * <pre>
     * ||A|| = sqrt(A1^2 + A2^2)
     * ||B|| = sqrt(B1^2 + B2^2)
     * </pre>
     *
     * @param travel 사용자의 여행 선호도.
     * @return 크기를 나타내는 NumberExpression.
     */
    private NumberExpression<Double> calculateDMagnitude(Travel travel) {
        NumberExpression<Double> leftHand = add(
                sqrt(squared(travelogue.statistics.genderAvg)),
                sqrt(squared(travelogue.statistics.ageGroupAvg)));

        NumberExpression<Double> rightHand = add(
                sqrt(squared(travel.statistics().genderAvg())),
                sqrt(squared(travel.statistics().ageGroupAvg())));

        return multiply(leftHand, rightHand);
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

    private NumberExpression<Double> multiply(Object left, Object right) {
        return Expressions.numberTemplate(Double.class, "({0} * {1})", left, right);
    }
}