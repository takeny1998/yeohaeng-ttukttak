package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.image.entity.TravelVisitImage;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.ToString;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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

    @OneToMany(mappedBy = "visit")
    private List<TravelVisitImage> images = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private VisitReason reason;

    private Integer satisfaction;

    private Integer revisit;

    private Integer recommend;

    public Long id() {
        return id;
    }

    public LocalDate visitedOn() {
        return visitedOn;
    }

    public Integer seq() {
        return seq;
    }

    public Place place() {
        return place;
    }

    public Travel travel() {
        return travel;
    }

    public VisitReason reason() {
        return reason;
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

    public List<TravelVisitImage> images() {
        return images;
    }
}
