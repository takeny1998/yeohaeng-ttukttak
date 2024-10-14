package com.yeohaeng_ttukttak.server.domain.geography.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Region;
import org.springframework.context.i18n.LocaleContextHolder;

import java.util.Locale;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public record RegionDto(
        Long id,
        String name,
        String shortName
) {

    public static RegionDto of(Region region) {
        final Locale locale = LocaleContextHolder.getLocale();
        return new RegionDto(
                region.id(),
                region.name(locale),
                region.shortName(locale));
    }

}
