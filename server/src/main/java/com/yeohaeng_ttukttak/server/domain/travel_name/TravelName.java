package com.yeohaeng_ttukttak.server.domain.travel_name;

import jakarta.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Embeddable
@EqualsAndHashCode
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelName {

    private String name;

    private boolean isGenerated;

    TravelName(String name) {
        this(name, false);
    }

    TravelName(String name, boolean isGenerated) {
        this.name = name;
        this.isGenerated = isGenerated;
    }

    public String name() {
        return name;
    }

    public boolean isGenerated() {
        return isGenerated;
    }
}
