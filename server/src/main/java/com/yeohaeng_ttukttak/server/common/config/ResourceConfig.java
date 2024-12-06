package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.domain.locale.HashMapLocalizedMessagesProvider;
import com.yeohaeng_ttukttak.server.domain.locale.LocalizedMessagesProvider;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

@Slf4j
@Configuration
public class ResourceConfig {

    @Bean
    public LocalizedMessagesProvider adjectivesProvider() {

        return new HashMapLocalizedMessagesProvider(Map.of(
                Locale.ENGLISH, loadWords("data/adjectives_en.txt"),
                Locale.KOREAN, loadWords("data/adjectives_ko.txt")));
    }

    @Bean
    public LocalizedMessagesProvider animalsProvider() {

        return new HashMapLocalizedMessagesProvider(Map.of(
                Locale.ENGLISH, loadWords("data/animals_en.txt"),
                Locale.KOREAN, loadWords("data/animals_ko.txt")));
    }

    private List<String> loadWords(String... paths) {
        final List<String> words = new ArrayList<>();

        for (String path : paths) {
            final Resource resource = new ClassPathResource(path);

            try (BufferedReader br = new BufferedReader(
                    new InputStreamReader(resource.getInputStream()))) {

                br.lines().forEach(words::add);

            } catch (IOException ignored) {}
        }


        log.info("[ResourceConfig.loadWords] loaded {} words from {}", words.size(), paths);

        return words;
    }

}
