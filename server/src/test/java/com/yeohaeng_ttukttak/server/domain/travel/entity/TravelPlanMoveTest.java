package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL;
import static org.assertj.core.api.Assertions.*;

class TravelPlanMoveTest {

    static final class TravelProxy extends Travel {

        @Override
        public LocalDate startedOn() {
            return LocalDate.of(2025, 1, 29);
        }

        @Override
        public LocalDate endedOn() {
            return LocalDate.of(2025, 1, 31);
        }

    }

    static final class PlaceProxy extends Place {}

    private TravelPlan travelPlan;

    @BeforeEach
    void init() {
        travelPlan = new TravelPlan(
                0, 0, new PlaceProxy(), new TravelProxy());
        
    }

    @Nested
    @DisplayName("updateOrder() 테스트")
    class UpdateOrderTest {

        @Test
        @DisplayName("성공")
        void success() {

            // Given
            final LocalDate willVisitOn =
                    LocalDate.of(2025, 1, 30);

            final int orderOfPlan = 1;

            // When
            travelPlan.updateOrder(willVisitOn, orderOfPlan);

            // Then
            assertThat(travelPlan.getWillVisitOn())
                    .as("지정한 날짜로 변경되어야 한다.")
                    .isEqualTo(willVisitOn);

            assertThat(travelPlan.getOrderOfPlan())
                    .as("지정한 순서로 변경되어야 한다.")
                    .isEqualTo(orderOfPlan);
        }

        @Test
        @DisplayName("기간에서 벗어난 경우 예외를 발생한다.")
        void notWithinPeriod() {

            // Given
            final LocalDate willVisitOn =
                    LocalDate.of(2025, 2, 14);

            final int orderOfPlan = 1;

            // When
            final Throwable throwable = catchThrowable(() ->
                    travelPlan.updateOrder(willVisitOn, orderOfPlan));

            // Then
            assertThat(throwable)
                    .as("여행 기간에 벗어난 경우 예외를 발생해야 한다.")
                    .isEqualTo(WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL.wrap());
        }


    }

}