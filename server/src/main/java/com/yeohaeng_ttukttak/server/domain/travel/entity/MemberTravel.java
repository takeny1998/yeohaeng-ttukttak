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

    @Enumerated(EnumType.STRING)
    private CompanionType companionType;

    public MemberTravel(Member member, LocalDate startedOn, LocalDate endedOn, CompanionType companionType) {
        super(startedOn, endedOn);
        this.member = member;
        this.companionType = companionType;
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
        final boolean containsCity = cities().stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (containsCity) {
            return;
        }
        cities().add(new TravelCity(this, city));
    }



}
