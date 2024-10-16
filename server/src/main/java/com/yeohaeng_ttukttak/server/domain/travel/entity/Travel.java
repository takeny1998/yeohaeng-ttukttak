package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static jakarta.persistence.InheritanceType.JOINED;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Inheritance(strategy = JOINED)
public abstract class Travel {

    @Id @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "travel_id_generator"
    )
    @SequenceGenerator(
            name = "travel_id_generator",
            sequenceName = "travel_seq",
            initialValue = 100000
    )
    private Long id;

    private LocalDate startedOn;

    private LocalDate endedOn;

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    private List<TravelCity> cities = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    private List<TravelCompanion> companions = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    private List<TravelMotivation> motivations = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    private List<TravelVisit> visits = new ArrayList<>();

    public Travel(LocalDate startedOn, LocalDate endedOn) {
        this.startedOn = startedOn;
        this.endedOn = endedOn;
    }

    abstract public AgeGroup ageGroup();

    abstract public Gender gender();

    abstract public CompanionType companionType();

    public Long id() {
        return id;
    }

    public LocalDate startedOn() {
        return startedOn;
    }

    public LocalDate endedOn() {
        return endedOn;
    }

    public List<TravelCompanion> companions() {
        return companions;
    }

    public List<TravelMotivation> motivations() {
        return motivations;
    }

    public List<TravelCity> cities() {
        return cities;
    }

    public List<TravelVisit> visits() {
        return visits;
    }

}
