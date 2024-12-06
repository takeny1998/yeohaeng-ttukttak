package com.yeohaeng_ttukttak.server.domain.nickname;

import com.yeohaeng_ttukttak.server.domain.locale.LocalizedMessagesProvider;
import com.yeohaeng_ttukttak.server.domain.member.exception.BadNicknameFailException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class NicknameService {

    private final LocalizedMessagesProvider adjectivesProvider;
    private final LocalizedMessagesProvider animalsProvider;

    private static final Random random = new Random();

    public String generate(Locale locale) {

        final List<String> adjectives = adjectivesProvider.get(locale);
        final List<String> animals = animalsProvider.get(locale);

        return "%s %s".formatted(
                adjectives.get(random.nextInt(adjectives.size())),
                animals.get(random.nextInt(animals.size())));
    }

}
