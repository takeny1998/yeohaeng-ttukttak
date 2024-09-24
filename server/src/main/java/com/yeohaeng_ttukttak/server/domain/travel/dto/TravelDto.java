package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;

public record TravelDto() {

    public TravelDto(Travel travel) {
        this();
    }

}
