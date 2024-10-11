package com.yeohaeng_ttukttak.server.domain.place.entity;

import jakarta.persistence.*;
import lombok.ToString;

@Entity
@ToString
public class PlaceCategoryMapping {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "place_id")
    private Place place;

    @Enumerated(EnumType.STRING)
    private PlaceCategory category;

    public PlaceCategory category() {
        return category;
    }

}
