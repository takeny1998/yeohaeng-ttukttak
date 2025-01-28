package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

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

    public TravelPlan setOrderOfPlan(Integer orderOfPlan) {
        this.orderOfPlan = orderOfPlan;
        return this;
    }

}
