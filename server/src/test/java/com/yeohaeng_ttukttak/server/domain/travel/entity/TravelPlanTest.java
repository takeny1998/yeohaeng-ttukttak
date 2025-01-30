package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import lombok.Getter;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL;
import static org.assertj.core.api.Assertions.*;

class TravelPlanTest {

    static final class TravelProxy extends Travel {
        @Override
        public LocalDate startedOn() {
            return LocalDate.of(2025, 1, 29);
        }

        @Override
        public LocalDate endedOn() {
            return LocalDate.of(2025, 1, 31);
        }

        public void addPlan(final TravelPlan newPlan) {
            newPlan.setTravel(this);
            super.plans().add(newPlan);
        }
    }

    @Nested
    @DisplayName("updateOrder() 테스트")
    class UpdateOrderTest {

        static final class PlaceProxy extends Place {}

        private TravelPlan travelPlan;

        @BeforeEach
        void init() {
            travelPlan = new TravelPlan(new PlaceProxy());
            travelPlan.setTravel(new TravelProxy());
        }

        @Test
        @DisplayName("성공")
        void updateOrderSuccess() {
            // Given
            final LocalDate willVisitOn = LocalDate.of(2025, 1, 30);
            final int orderOfPlan = 1;

            // When
            travelPlan.updateOrder(willVisitOn, orderOfPlan);

            // Then
            assertTravelPlanUpdated(willVisitOn, orderOfPlan);
        }

        private void assertTravelPlanUpdated(LocalDate willVisitOn, int orderOfPlan) {
            assertThat(travelPlan.getWillVisitOn())
                    .as("지정한 날짜로 변경되어야 한다.")
                    .isEqualTo(willVisitOn);

            assertThat(travelPlan.getOrderOfPlan())
                    .as("지정한 순서로 변경되어야 한다.")
                    .isEqualTo(orderOfPlan);
        }

        @Test
        @DisplayName("기간에서 벗어난 경우 예외를 발생한다.")
        void updateOrderThrowsExceptionWhenOutOfPeriod() {
            // Given
            final LocalDate willVisitOn = LocalDate.of(2025, 2, 14);
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

    @Nested
    @DisplayName("reorderBehindPlans() 테스트")
    class ReorderBehindPlansTest {

        @Getter
        static class TravelPlanProxy extends TravelPlan {
            private Long id;
            private LocalDate willVisitOn;
            private Integer orderOfPlan;

            public TravelPlanProxy(final Long id, final int year, final int month, final int day, final int orderOfPlan) {
                this.id = id;
                this.willVisitOn = LocalDate.of(year, month, day);
                this.orderOfPlan = orderOfPlan;
            }

            private TravelPlanProxy() {}

            @Override
            public void updateOrder(final LocalDate willVisitOn, final int orderOfPlan) {
                this.willVisitOn = willVisitOn;
                this.orderOfPlan = orderOfPlan;
            }
        }

        @Test
        void reorderBehindPlansSuccess() {
            // Given
            final TravelProxy travel = new TravelProxy();
            createTravelPlans().forEach(travel::addPlan);

            final TravelPlan travelPlan = travel.plans().get(3);
            final LocalDate willVisitOn = LocalDate.of(2025, 1, 29);

            // When
            travelPlan.updateOrder(willVisitOn, 3);
            travel.reorderBehindPlans(travelPlan);

            // Then
            assertThat(travel.plans().get(1).getOrderOfPlan())
                    .as("orderOfPlan이 같은 일정은 뒤로 이동해야 한다.")
                    .isEqualTo(4);

            assertThat(travel.plans().get(2).getOrderOfPlan())
                    .as("orderOfPlan이 큰 일정은 뒤로 이동해야 한다.")
                    .isEqualTo(5);

            assertThat(travel.plans().get(0).getOrderOfPlan())
                    .as("orderOfPlan가 작은 일정은 이동하지 않아야 한다.")
                    .isEqualTo(1);

            assertThat(travel.plans().get(4).getOrderOfPlan())
                    .as("orderOfPlan이 같거나 커도 dayOfTravel이 다르면 이동하지 않아야 한다.")
                    .isEqualTo(3);
        }

        private static List<TravelPlan> createTravelPlans() {
            return List.of(
                    new TravelPlanProxy(1L, 2025, 1, 29, 1),
                    new TravelPlanProxy(2L, 2025, 1, 29, 3),
                    new TravelPlanProxy(3L, 2025, 1, 29, 4),
                    new TravelPlanProxy(4L, 2025, 1, 29, 5),
                    new TravelPlanProxy(5L, 2025, 1, 30, 3));
        }
    }


}