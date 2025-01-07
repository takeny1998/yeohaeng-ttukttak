package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.domain.locale.LocalizedMessagesProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import java.util.List;

@Profile(value = "test")
@Configuration
public class ResourceTestConfig implements ResourceConfigurable {

    private static final LocalizedMessagesProvider provider = locale -> List.of();

    @Override
    @Bean
    public List<String> fWords() {
        return List.of();
    }

    @Override
    @Bean
    public LocalizedMessagesProvider adjectivesProvider() {
        return provider;
    }

    @Override
    @Bean
    public LocalizedMessagesProvider animalsProvider() {
        return provider;
    }
}
