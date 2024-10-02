package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.ToString;

import java.time.LocalDate;

@Entity
@ToString
public class TravelVisit {

    @Id
    private Long id;

    @NotNull
    private LocalDate visitedOn;

    @NotNull
    private Integer seq;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "place_id")
    private Place place;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private VisitReason reason;

    private Integer satisfaction;

    private Integer revisit;

    private Integer recommend;

}
