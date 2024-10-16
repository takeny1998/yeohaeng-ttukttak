package com.yeohaeng_ttukttak.server.domain.place.entity;

import com.yeohaeng_ttukttak.server.domain.image.entity.TravelVisitImage;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
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

    @OneToMany(mappedBy = "place")
    private List<PlaceCategoryMapping> categories = new ArrayList<>();

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

    public List<PlaceCategoryMapping> categories() {
        return categories;
    }

}
