package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.ForbiddenErrorException;
import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
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

    public TravelPlan(Integer dayOfTravel, Integer orderOfPlan, Place place, Travel travel) {
        this.dayOfTravel = dayOfTravel;
        this.orderOfPlan = orderOfPlan;
        this.place = place;
        this.travel = travel;
    }

    public TravelPlan setDayOfTravel(Integer dayOfTravel) {
        this.dayOfTravel = dayOfTravel;
        return this;
    }

    public TravelPlan setOrderOfPlan(Integer orderOfVisit) {
        this.orderOfPlan = orderOfVisit;
        return this;
    }

    public Long id() {
        return id;
    }

    Place place() {
        return place;
    }

    Travel travel() {
        return travel;
    }

    public Integer dayOfTravel() {
        return dayOfTravel;
    }

    public Integer orderOfPlan() {
        return orderOfPlan;
    }

}
