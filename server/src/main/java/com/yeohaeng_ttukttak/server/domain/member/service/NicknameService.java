package com.yeohaeng_ttukttak.server.domain.member.service;

import com.yeohaeng_ttukttak.server.common.config.WordsProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class NicknameService {

    private final WordsProperties wordsProperties;

    private static final Random random = new Random();

    public String generate() {
        Locale locale = LocaleContextHolder.getLocale();

        final List<String> adjectives = wordsProperties.getAdjectives(locale);
        final List<String> animals = wordsProperties.getAnimals(locale);

        return "%s %s".formatted(
                adjectives.get(random.nextInt(adjectives.size())),
                animals.get(random.nextInt(animals.size())));
    }

}
