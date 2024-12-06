package com.yeohaeng_ttukttak.server.common.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;
import java.util.Locale;
import java.util.Map;


@Slf4j
@ConfigurationProperties(prefix = "words")
public record WordsProperties(
        Map<String, List<String>> adjectives,
        Map<String, List<String>> animals
) {

    public List<String> getAdjectives(Locale locale) {

        log.debug("keys = {}", adjectives.keySet());

        return adjectives.getOrDefault(locale.getLanguage(), adjectives.get("en"));
    }

    public List<String> getAnimals(Locale locale) {
        return animals.getOrDefault(locale.getLanguage(), animals.get("en"));
    }
}
