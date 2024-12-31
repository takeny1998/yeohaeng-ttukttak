package com.yeohaeng_ttukttak.server.domain.travelogue.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Travelogue {

    @Id
    private Long id;

    private LocalDate startedOn;

    private LocalDate endedOn;

    private Double genderSum;

    private Double ageGroupSum;

    private Integer numberOfParticipant;

    @Enumerated(EnumType.STRING)
    private AgeGroup ageGroup;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @OneToMany(mappedBy = "travelogue")
    private List<TravelogueCompanion> companions = new ArrayList<>();

    @OneToMany(mappedBy = "travelogue")
    private List<TravelogueMotivation> motivations = new ArrayList<>();

    @OneToMany(mappedBy = "travelogue")
    private List<TravelogueVisit> visits = new ArrayList<>();

    public Long id() {
        return id;
    }

    public LocalDate startedOn() {
        return startedOn;
    }

    public LocalDate endedOn() {
        return endedOn;
    }

    public AgeGroup ageGroup() {
        return ageGroup;
    }

    public Gender gender() {
        return gender;
    }

    public List<TravelogueVisit> visits() {
        return visits;
    }

    public List<TravelogueCompanion> companions() {
        return companions;
    }

    public List<TravelogueMotivation> motivations() {
        return motivations;
    }
}
