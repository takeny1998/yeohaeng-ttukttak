package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

@Entity
@DiscriminatorValue("Initial")
public final class InitialTravel extends Travel {

    @Enumerated(EnumType.STRING)
    private AgeGroup ageGroup;

    @Override
    public AgeGroup ageGroup() {
        return ageGroup;
    }

}
