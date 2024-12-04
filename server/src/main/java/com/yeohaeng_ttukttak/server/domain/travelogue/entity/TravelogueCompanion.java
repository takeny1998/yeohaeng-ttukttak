package com.yeohaeng_ttukttak.server.domain.travelogue.entity;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanionType;
import jakarta.persistence.*;

@Entity
public class TravelogueCompanion {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travelogue_id")
    private Travelogue travelogue;

    @Enumerated(EnumType.STRING)
    private TravelCompanionType type;

    public Long id() {
        return id;
    }

    public Travelogue travelogue() {
        return travelogue;
    }

    public TravelCompanionType type() {
        return type;
    }
}
