package com.yeohaeng_ttukttak.server.domain.travelogue.entity;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import jakarta.persistence.*;

@Entity
public class TravelogueCompanion {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travelogue_id")
    private Travelogue travelogue;

    @Enumerated(EnumType.STRING)
    private CompanionType type;

    public Long id() {
        return id;
    }

    public Travelogue travelogue() {
        return travelogue;
    }

    public CompanionType type() {
        return type;
    }
}
