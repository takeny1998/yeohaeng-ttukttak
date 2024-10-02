package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
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
public final class InputTravel extends Travel {


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    @Enumerated(EnumType.STRING)
    private Companion companion;

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    public List<TravelCity> travelCities = new ArrayList<>();

    public InputTravel(Member member, LocalDate startedOn, LocalDate endedOn, Companion companion) {
        super(startedOn, endedOn);
        this.member = member;
        this.companion = companion;
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

    public Companion companion() {
        return companion;
    }
}
