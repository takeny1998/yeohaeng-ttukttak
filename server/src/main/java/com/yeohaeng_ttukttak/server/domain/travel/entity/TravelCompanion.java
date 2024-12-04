package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelCompanion {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @NotNull
    @Enumerated(EnumType.STRING)
    private TravelCompanionType type;

    protected TravelCompanion(Travel travel, TravelCompanionType type) {
        this.travel = travel;
        this.type = type;
    }

    public Long id() {
        return id;
    }

    public TravelCompanionType type() {
        return type;
    }

}
