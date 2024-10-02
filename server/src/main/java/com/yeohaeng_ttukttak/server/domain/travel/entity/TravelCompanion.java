package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import lombok.ToString;

@Entity
@ToString
public class TravelCompanion {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private Companion companion;


}
