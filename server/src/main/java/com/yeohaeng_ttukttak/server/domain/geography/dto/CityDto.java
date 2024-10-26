package com.yeohaeng_ttukttak.server.domain.geography.dto;

import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.image.dto.ImageDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.i18n.LocaleContextHolder;

import java.util.Locale;

@Slf4j
public record CityDto(
    Long id,
    String name,
    Long regionId,
    ImageDto insignia
) {

    public static CityDto of(City city) {
        final Locale locale = LocaleContextHolder.getLocale();


        return new CityDto(
                city.id(),
                city.name(locale),
                city.parent().id(),
                ImageDto.of(city.insignia()));
    }

}
