package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class TravelCity {

    @Id @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "travel_city_id_generator"
    )
    @SequenceGenerator(
            name = "travel_city_id_generator",
            sequenceName = "travel_city_seq",
            initialValue = 30000
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city_id")
    private City city;

    public TravelCity(MemberTravel travel, City city) {
        this.travel = travel;
        this.city = city;
    }

    public City city() {
        return city;
    }
}
