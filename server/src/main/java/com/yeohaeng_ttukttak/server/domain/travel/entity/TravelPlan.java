package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelPlan extends BaseTimeMemberEntity {

    @Id @GeneratedValue
    private Long id;

    @NotNull
    private Integer dayOfTravel;

    @NotNull
    private Integer orderOfPlan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "place_id")
    private Place place;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @OrderBy("createdAt DESC, lastModifiedAt DESC, id ASC")
    @OneToMany(mappedBy = "plan", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelPlanComment> comments = new ArrayList<>();

    public TravelPlan(final Place place) {
        this.place = place;
    }

    /**
     * 해당 일정의 날짜 및 순서를 변경합니다.
     *
     * @param willVisitOn 변경할 날짜; null 이 아니어야 합니다.
     * @param orderOfPlan 변경할 순서; null 이 아니고, 0보다 같거나 커야 합니다.
     */
    public void updateOrder(
            final LocalDate willVisitOn, final int orderOfPlan) {

        final LocalDate startDate = travel.startedOn();
        final LocalDate endDate = travel.endedOn();

        final boolean isWithinPeriod = LocalDateUtil
                .isInRange(willVisitOn, startDate, endDate);

        if (!isWithinPeriod) {
            throw ExceptionCode.WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL.wrap();
        }

        this.dayOfTravel = (int) LocalDateUtil
                .getBetweenDays(startDate, willVisitOn) - 1;

        this.orderOfPlan = orderOfPlan;
    }

    protected void setTravel(final Travel travel) {
        this.travel = travel;
    }

    public LocalDate getWillVisitOn() {
        return travel
                .startedOn()
                .plusDays(dayOfTravel);
    }

}
