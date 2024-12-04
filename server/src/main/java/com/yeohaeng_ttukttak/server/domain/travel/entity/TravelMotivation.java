package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class TravelMotivation {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private TravelMotivationType type;

       protected TravelMotivation(Travel travel, TravelMotivationType type) {
        this.travel = travel;
        this.type = type;
    }

    public TravelMotivationType type() {
        return type;
    }

}
