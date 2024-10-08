package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static jakarta.persistence.InheritanceType.SINGLE_TABLE;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Inheritance(strategy = SINGLE_TABLE)
public abstract class Travel {

    @Id @GeneratedValue
    private Long id;

    private LocalDate startedOn;

    private LocalDate endedOn;

    @Enumerated(EnumType.STRING)
    private Companion companion;

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    public List<TravelMotivation> motivations = new ArrayList<>();

    public Travel(LocalDate startedOn, LocalDate endedOn, Companion companion) {
        this.startedOn = startedOn;
        this.endedOn = endedOn;
        this.companion = companion;
    }

    abstract AgeGroup ageGroup();

}
