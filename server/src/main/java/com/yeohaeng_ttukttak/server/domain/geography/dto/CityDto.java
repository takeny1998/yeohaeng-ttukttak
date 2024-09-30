package com.yeohaeng_ttukttak.server.domain.geography.dto;

import com.yeohaeng_ttukttak.server.domain.geography.entity.City;

import java.util.Locale;

public record CityDto(
    Long id,
    String name,
    Long regionId
) {

    public static CityDto of(City city, Locale locale) {
        return new CityDto(
                city.id(),
                city.name(locale),
                city.parent().id());
    }

}
