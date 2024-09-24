package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.place.entity.City;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DiscriminatorValue("Input")
public final class InputTravel extends Travel {

    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    public List<TravelCity> travelCities = new ArrayList<>();

    public InputTravel(Member member, String name, LocalDate startedOn, LocalDate endedOn, CompanionType companionType) {
        super(startedOn, endedOn, companionType);
        this.member = member;
        this.name = name;
    }

    public String name() {
        return name;
    }

    @Override
    AgeGroup ageGroup() {
        return member.ageGroup();
    }

    public void addCity(City city) {
        final boolean containsCity = travelCities.stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (containsCity) return;
        travelCities.add(new TravelCity(this, city));
    }

}
