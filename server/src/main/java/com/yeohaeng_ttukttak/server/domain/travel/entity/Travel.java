package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import jakarta.persistence.*;
import lombok.ToString;

import java.time.LocalDate;

import static jakarta.persistence.InheritanceType.SINGLE_TABLE;

@Entity
@ToString
@Inheritance(strategy = SINGLE_TABLE)
public abstract class Travel {

    @Id
    private Long id;

    private String name;

    private LocalDate startedOn;

    private LocalDate endedOn;

    @Enumerated(EnumType.STRING)
    private CompanionType companionType;

    abstract AgeGroup ageGroup();

}
