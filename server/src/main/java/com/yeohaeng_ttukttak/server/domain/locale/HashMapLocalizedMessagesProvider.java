package com.yeohaeng_ttukttak.server.domain.locale;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.*;

@NoArgsConstructor(access = AccessLevel.PUBLIC)
public final class HashMapLocalizedMessagesProvider implements LocalizedMessagesProvider {

    private final Map<Locale, List<String>> locales = new HashMap<>();

    private static final Locale FALLBACK_LOCALE = Locale.ENGLISH;

    public HashMapLocalizedMessagesProvider(Map<Locale, List<String>> initialLocales) {
        locales.putAll(initialLocales);
    }

    public List<String> get(Locale locale) {
        final List<String> messages = locales
                .getOrDefault(locale, locales.get(FALLBACK_LOCALE));

        if (Objects.isNull(messages)) {
            throw new IllegalArgumentException(
                    "지정한 %s은 지원하지 않습니다.".formatted(locale));
        }

        return messages;
    }

}
