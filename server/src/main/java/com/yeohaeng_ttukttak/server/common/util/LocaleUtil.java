package com.yeohaeng_ttukttak.server.common.util;

import java.util.Locale;

public class LocaleUtil {

    public static String find(Locale locale, String korean, String english, String fallback) {
        return switch (locale.getLanguage()) {
            case "ko" -> korean;
            case "en" -> english;
            default -> fallback;
        };
    }

}
