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
    private Motivation motivation;

    public TravelMotivation(Travel travel, Motivation motivation) {
        this.travel = travel;
        this.motivation = motivation;

        travel.motivations.add(this);
    }

    public Motivation motivation() {
        return motivation;
    }
}
