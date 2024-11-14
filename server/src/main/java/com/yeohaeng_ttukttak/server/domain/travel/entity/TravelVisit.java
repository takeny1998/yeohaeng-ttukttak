package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.image.entity.TravelVisitImage;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelVisit {

    @Id @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "travel_visit_generator"
    )
    @SequenceGenerator(
            name = "travel_visit_generator",
            sequenceName = "travel_visit_seq",
            initialValue = 500000
    )
    private Long id;

    private Integer dayOfTravel;

    private Integer orderOfVisit;

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
    private TravelVisitReasonType reasonType;

    private Integer satisfaction;

    private Integer revisit;

    private Integer recommend;

    public TravelVisit(Travel travel, Place place) {
        this.travel = travel;
        this.place = place;
    }

    public Long id() {
        return id;
    }

    public Place place() {
        return place;
    }

    public Travel travel() {
        return travel;
    }

    public TravelVisitReasonType reasonType() {
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

    public Integer dayOfTravel() {
        return dayOfTravel;
    }

    public Integer orderOfVisit() {
        return orderOfVisit;
    }

    public List<TravelVisitImage> images() {
        return images;
    }
}
