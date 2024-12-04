package com.yeohaeng_ttukttak.server.domain.travelogue.entity;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelMotivationType;
import jakarta.persistence.*;

@Entity
public class TravelogueMotivation {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travelogue_id")
    private Travelogue travelogue;

    @Enumerated(EnumType.STRING)
    private TravelMotivationType type;

    public Long id() {
        return id;
    }

    public Travelogue travelogue() {
        return travelogue;
    }

    public TravelMotivationType type() {
        return type;
    }
}
