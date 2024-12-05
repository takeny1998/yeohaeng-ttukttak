package com.yeohaeng_ttukttak.server.domain.travelogue.entity;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.VisitReasonType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

@Entity
public class TravelogueVisit {

    @Id
    private Long id;

    @NotNull
    private Integer dayOfTravel;

    @NotNull
    private Integer orderOfVisit;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "place_id")
    private Place place;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travelogue_id")
    private Travelogue travelogue;

    @Enumerated(EnumType.STRING)
    private VisitReasonType reasonType;

    private Integer satisfaction;

    private Integer revisit;

    private Integer recommend;

    public Long id() {
        return id;
    }

    public Integer dayOfTravel() {
        return dayOfTravel;
    }

    public Integer orderOfVisit() {
        return orderOfVisit;
    }

    public Place place() {
        return place;
    }

    public Travelogue travelogue() {
        return travelogue;
    }

    public VisitReasonType reasonType() {
        return reasonType;
    }

    public Integer satisfaction() {
        return satisfaction;
    }

    public Integer revisit() {
        return revisit;
    }

    public Integer recommend() {
        return recommend;
    }
}
