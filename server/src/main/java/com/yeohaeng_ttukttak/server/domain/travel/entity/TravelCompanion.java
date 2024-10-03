package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelCompanion {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private Companion companion;

    public TravelCompanion(Travel travel, Companion companion) {
        this.travel = travel;
        this.companion = companion;
    }

    public Companion companion() {
        return companion;
    }

}
