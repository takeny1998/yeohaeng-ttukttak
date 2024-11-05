package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public final class MemberTravel extends Travel {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    public MemberTravel(Member member, LocalDate startedOn, LocalDate endedOn) {
        super(startedOn, endedOn);
        this.member = member;
    }

    @Override
    public AgeGroup ageGroup() {
        return member.ageGroup();
    }

    @Override
    public Gender gender() {
        return member.gender();
    }

    public void addCity(City city) {
        final boolean isAlreadyExist = cities().stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (isAlreadyExist) return;

        cities().add(new TravelCity(this, city));
    }

    public void addMotivation(TravelMotivationType travelMotivationType) {
        final boolean isAlreadyExist = motivations().stream()
                .anyMatch(tm -> tm.type().equals(travelMotivationType));

        if (isAlreadyExist) return;

        motivations().add(new TravelMotivation(this, travelMotivationType));
    }

    public void addCompanion(TravelCompanionType travelCompanionType) {
        final boolean isAlreadyExist = companions().stream()
                .anyMatch(tc -> tc.type().equals(travelCompanionType));

        if (isAlreadyExist) return;

        companions().add(new TravelCompanion(this, travelCompanionType));
    }


}
