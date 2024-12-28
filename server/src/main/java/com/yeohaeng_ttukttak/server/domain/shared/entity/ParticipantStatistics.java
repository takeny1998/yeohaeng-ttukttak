package com.yeohaeng_ttukttak.server.domain.shared.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import jakarta.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.averagingDouble;

@ToString
@EqualsAndHashCode
@Embeddable
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ParticipantStatistics {

    private Double ageGroupAvg = 0.0;

    private Double genderAvg = 0.0;

    public ParticipantStatistics(Member creator, List<TravelParticipant> participants) {
        update(creator, participants);
    }

    public void update(Member creator, List<TravelParticipant> participants) {
        final List<Member> members = new ArrayList<>(participants
                .stream().map(TravelParticipant::invitee)
                .filter(this::hasStatistics)
                .toList());

        if (hasStatistics(creator)) {
            members.add(creator);
        }

        this.ageGroupAvg = members.stream()
                .map(Member::ageGroup)
                .collect(averagingDouble(this::oneHotEncodeAgeGroup));

        this.genderAvg = members.stream()
                .map(Member::gender)
                .collect(averagingDouble(this::oneHotEncodeGender));

    }

    private boolean hasStatistics(Member member) {
        return Objects.nonNull(member.gender()) && Objects.nonNull(member.ageGroup());
    }

    private int oneHotEncodeGender(Gender gender) {
        return switch (gender) {
            case male -> 1;
            case female -> 0;
        };
    }

    private double oneHotEncodeAgeGroup(AgeGroup ageGroup) {
        return switch (ageGroup) {
            case underNine -> 0.125;
            case teens -> 0.25;
            case twenties -> 0.375;
            case thirties -> 0.5;
            case forties -> 0.625;
            case fifties -> 0.75;
            case sixties -> 0.875;
            case seventiesPlus -> 1.0;
        };
    }

    public Double ageGroupAvg() {
        return ageGroupAvg;
    }

    public Double genderAvg() {
        return genderAvg;
    }
}
