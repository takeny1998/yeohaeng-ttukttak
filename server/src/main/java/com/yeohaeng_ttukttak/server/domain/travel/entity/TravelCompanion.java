package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelCompanion {

    @Id @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "travel_companion_generator"
    )
    @SequenceGenerator(
            name = "travel_companion_generator",
            sequenceName = "travel_companion_seq",
            initialValue = 100000
    )
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @NotNull
    @Enumerated(EnumType.STRING)
    private TravelCompanionType type;

    @Enumerated(EnumType.STRING)
    private AgeGroup ageGroup;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    public TravelCompanion(Travel travel, TravelCompanionType type) {
        this.travel = travel;
        this.type = type;
    }

    public Long id() {
        return id;
    }

    public TravelCompanionType type() {
        return type;
    }

    public AgeGroup ageGroup() {
        return ageGroup;
    }

    public Gender gender() {
        return gender;
    }
}
