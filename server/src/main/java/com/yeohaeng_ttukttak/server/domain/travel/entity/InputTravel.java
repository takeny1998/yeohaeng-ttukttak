package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.List;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public final class InputTravel extends Travel {


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    public InputTravel(Member member, LocalDate startedOn, LocalDate endedOn) {
        super(startedOn, endedOn);
        this.member = member;
    }

    @Override
    public AgeGroup ageGroup() {
        return member.ageGroup();
    }

    public void addCity(City city) {
        final boolean containsCity = cities().stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (containsCity) {
            return;
        }
        cities().add(new TravelCity(this, city));
    }

    public void addCompanion(Companion companion) {
        final boolean containsCompanion = companions().stream()
                .anyMatch(tc -> tc.companion().equals(companion));

        if (containsCompanion) {
            return;
        }

        companions().add(new TravelCompanion(this, companion));
    }



}
