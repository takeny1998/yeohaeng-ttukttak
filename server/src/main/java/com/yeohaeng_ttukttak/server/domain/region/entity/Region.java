package com.yeohaeng_ttukttak.server.domain.region.entity;

import com.yeohaeng_ttukttak.server.common.util.LocaleUtil;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

import java.util.Locale;

@Entity
@DiscriminatorValue("0")
public final class Region extends Geography {

    private String shortName;

    private String shortNameEng;

    public String shortName(Locale locale) {
        return LocaleUtil.find(locale, shortName, shortNameEng, shortName);
    }

}
