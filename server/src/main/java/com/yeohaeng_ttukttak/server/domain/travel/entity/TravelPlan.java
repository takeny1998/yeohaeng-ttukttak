package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelPlan {

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

    @OneToMany(mappedBy = "plan", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<TravelPlanComment> comments = new ArrayList<>();

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

    public Place place() {
        return place;
    }

    public Travel travel() {
        return travel;
    }

    public Integer dayOfTravel() {
        return dayOfTravel;
    }

    public Integer orderOfPlan() {
        return orderOfPlan;
    }

    public void writeComment() {
        comments.add(new TravelPlanComment(this));
    }

}
