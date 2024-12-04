package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelCompanion {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @NotNull
    @Enumerated(EnumType.STRING)
    private CompanionType type;

    protected TravelCompanion(Travel travel, CompanionType type) {
        this.travel = travel;
        this.type = type;
    }

    public Long id() {
        return id;
    }

    public CompanionType type() {
        return type;
    }

}
