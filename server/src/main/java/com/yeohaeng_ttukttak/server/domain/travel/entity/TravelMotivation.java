package com.yeohaeng_ttukttak.server.domain.travel.entity;

import jakarta.persistence.*;
import lombok.ToString;

@Entity
@ToString
public class TravelMotivation {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tarvel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private MotivationType motivationType;

}
