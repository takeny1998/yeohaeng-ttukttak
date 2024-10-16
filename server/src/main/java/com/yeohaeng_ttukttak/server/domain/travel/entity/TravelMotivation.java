package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class TravelMotivation {

    @Id @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "travel_motivation_generator"
    )
    @SequenceGenerator(
            name = "travel_motivation_generator",
            sequenceName = "travel_motivation_seq",
            initialValue = 100000
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tarvel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private Motivation motivation;

    public TravelMotivation(Travel travel, Motivation motivation) {
        this.travel = travel;
        this.motivation = motivation;
    }

    public Motivation motivation() {
        return motivation;
    }

}
