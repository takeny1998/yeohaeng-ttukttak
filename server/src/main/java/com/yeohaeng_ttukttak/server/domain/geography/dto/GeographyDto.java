package com.yeohaeng_ttukttak.server.domain.geography.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.image.dto.ImageDto;
import org.springframework.context.i18n.LocaleContextHolder;

import java.util.Locale;
import java.util.Objects;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public record GeographyDto(
        Long id,
        Integer level,
        Long parentId,
        String name,
        String shortName,
        ImageDto insignia
) {

    public static GeographyDto of(Geography geography) {
        final Locale locale = LocaleContextHolder.getLocale();

        final Long parentId = Objects.nonNull(geography.parent())
                ? geography.parent().id()
                : null;

        final ImageDto insignia = Objects.nonNull(geography.insignia())
                ? ImageDto.of(geography.insignia())
                : null;

        return new GeographyDto(
                geography.id(),
                geography.level(),
                parentId,
                geography.name(locale),
                geography.shortName(locale),
                insignia);
    }

}
