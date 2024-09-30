package com.yeohaeng_ttukttak.server.domain.region.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.region.entity.Region;

import java.util.Locale;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public record RegionDto(
        Long id,
        String name,
        String shortName
) {

    public static RegionDto of(Region region, Locale locale) {
        return new RegionDto(
                region.id(),
                region.name(locale),
                region.shortName(locale));
    }

}
