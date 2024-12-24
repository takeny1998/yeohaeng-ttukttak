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

    TravelName(String name) {
        this.name = name;
    }

    public String name() {
        return name;
    }
}
