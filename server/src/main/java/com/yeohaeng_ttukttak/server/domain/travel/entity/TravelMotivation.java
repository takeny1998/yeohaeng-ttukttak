package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class TravelMotivation {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tarvel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private MotivationType motivationType;

    public TravelMotivation(Travel travel, MotivationType motivationType) {
        this.travel = travel;
        this.motivationType = motivationType;

        travel.motivations.add(this);
    }
}
