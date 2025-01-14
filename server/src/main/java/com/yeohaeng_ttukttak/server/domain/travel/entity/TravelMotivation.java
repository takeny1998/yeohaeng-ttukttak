package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Objects;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString(of = "type")
public class TravelMotivation {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @Enumerated(EnumType.STRING)
    private MotivationType type;

       protected TravelMotivation(Travel travel, MotivationType type) {
        this.travel = travel;
        this.type = type;
    }

    public MotivationType type() {
        return type;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        return (type == ((TravelMotivation) object).type);
    }

    @Override
    public int hashCode() {
        return Objects.hash(type);
    }

}
