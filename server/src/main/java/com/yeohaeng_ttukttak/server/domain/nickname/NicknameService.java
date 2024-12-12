package com.yeohaeng_ttukttak.server.domain.nickname;

import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.locale.LocalizedMessagesProvider;
import com.yeohaeng_ttukttak.server.domain.member.exception.BadNicknameFailException;
import com.yeohaeng_ttukttak.server.domain.member.exception.InvalidNicknameCharacterFailException;
import com.yeohaeng_ttukttak.server.domain.member.exception.InvalidNicknameLengthFailException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ServerErrorException;

import java.io.UnsupportedEncodingException;
import java.util.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class NicknameService {

    private final LocalizedMessagesProvider adjectivesProvider;
    private final LocalizedMessagesProvider animalsProvider;

    private static final Random random = new Random();

    private final List<String> fWords;

    /**
     * 닉네임의 제약 조건을 검사하고, 문제가 없으면 생성한다.
     * @param value 설정할 닉네임
     * @throws BadNicknameFailException 부적절한 닉네임일 경우 발생한다.
     * @return 생성된 닉네임 엔티티
     */
    public Nickname create(String value) {

        final int byteLength = StringUtil.getByteLengthInEucKr(value);

        if (byteLength < 4 || byteLength > 12) {
            throw new InvalidNicknameLengthFailException();
        }

        final boolean hasCharOrNumber = value.matches("^[가-힣a-zA-Z1-9]+$");
        final boolean hasCharMoreThanTwo = value.matches("(?:.*[가-힣a-zA-Z]){2,}");

        if (!hasCharOrNumber || !hasCharMoreThanTwo) {
            throw new InvalidNicknameCharacterFailException();
        }

        final String onlyCharValue = value
                .replaceAll("[\\d\\s]", "")
                .toLowerCase();

        for (String fWord : fWords) {
            if (onlyCharValue.contains(fWord)) {
                throw new BadNicknameFailException();
            }
        }

        return new Nickname(value);
    }

    public Nickname generate(Locale locale) {
        final List<String> adjectives = adjectivesProvider.get(locale);
        final List<String> animals = animalsProvider.get(locale);

        final String adjective = adjectives.get(random.nextInt(adjectives.size()));
        final String animal = animals.get(random.nextInt(animals.size()));

        return new Nickname("%s %s".formatted(adjective, animal));
    }

}
