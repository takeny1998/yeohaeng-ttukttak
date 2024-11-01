package com.yeohaeng_ttukttak.server.domain.place.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.ToString;

@Entity
@ToString
public class PlaceCategory {

    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "place_id")
    private Place place;

    @NotNull
    private int count;

    @Enumerated(EnumType.STRING)
    private PlaceCategoryType type;

    public PlaceCategoryType type() {
        return type;
    }

}
