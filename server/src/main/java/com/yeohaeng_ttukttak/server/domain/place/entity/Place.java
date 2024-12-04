package com.yeohaeng_ttukttak.server.domain.place.entity;

import com.yeohaeng_ttukttak.server.domain.travelogue.entity.TravelogueVisit;
import jakarta.persistence.*;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString(exclude = {"categories", "visits"})
@NoArgsConstructor(access = PROTECTED)
public final class Place {

    @Id
    private Long id;

    private String name;

    private Integer regionCode;

    private String lotNumberAddress;

    private String roadAddress;

    private Double longitude;

    private Double latitude;

    @OrderBy("count DESC, type ASC")
    @OneToMany(mappedBy = "place")
    private List<PlaceCategory> categories = new ArrayList<>();

    @OneToMany(mappedBy = "place")
    private List<TravelogueVisit> visits = new ArrayList<>();

    public Long id() {
        return id;
    }

    public String name() {
        return name;
    }

    public Integer regionCode() {
        return regionCode;
    }

    public String lotNumberAddress() {
        return lotNumberAddress;
    }

    public String roadAddress() {
        return roadAddress;
    }

    public Double longitude() {
        return longitude;
    }

    public Double latitude() {
        return latitude;
    }

    public List<PlaceCategory> categories() {
        return categories;
    }

    public List<TravelogueVisit> visits() {
        return visits;
    }

}
