package com.yeohaeng_ttukttak.server.domain.nickname;

import com.yeohaeng_ttukttak.server.domain.member.exception.BadNicknameFailException;
import com.yeohaeng_ttukttak.server.domain.member.exception.NicknameCharacterFailException;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class NicknameServiceTest {

    private final NicknameService nicknameService;

    public NicknameServiceTest() {
        this.nicknameService = new NicknameService(
                new StaticMessagesProvider(),
                new StaticMessagesProvider(),
                List.of("비속어"));
    }

    @Nested
    @DisplayName("create()")
    class CreateTest {

        @Test
        @DisplayName("정상인 경우")
        public void success() {
            // Given
            final String givenValue = "닉네임";

            // When
            final Nickname nickname = nicknameService.create(givenValue);

            // Then
            assertThat(nickname.value())
                    .as("성공해야 한다.")
                    .isEqualTo(givenValue);
        }

        @Test
        @DisplayName("비속어가 들어간 경우")
        public void badWord() {
            // Given
            final String givenValue = "비속어닉";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(givenValue))
                    .as("예외를 발생해야 한다.")
                    .isInstanceOf(BadNicknameFailException.class);
        }

        @Test
        @DisplayName("비속어 사이에 숫자가 들어간 경우")
        public void numberBetweenBadWord() {
            // Given
            final String givenValue = "비12속어닉";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(givenValue))
                    .as("예외를 발생해야 한다.")
                    .isInstanceOf(BadNicknameFailException.class);
        }

        @Test
        @DisplayName("비속어 사이에 공백이 들어간 경우")
        public void spaceBetweenBadWord() {
            // Given
            final String givenValue = "비속어닉";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(givenValue))
                    .as("예외를 발생해야 한다.")
                    .isInstanceOf(BadNicknameFailException.class);
        }

        @Test
        @DisplayName("비속어 사이에 숫자와 공백이 들어간 경우")
        public void spaceAndNumberBetweenBadWord() {
            // Given
            final String givenValue = "비5속어";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(givenValue))
                    .as("예외를 발생해야 한다.")
                    .isInstanceOf(BadNicknameFailException.class);
        }

        @Test
        @DisplayName("한글 자음 혹은 모음만 들어간 경우")
        public void onlyJaEumOrMoEnm() {
            // Given
            final String givenValue = "ㅅㅣㅂㅏㄹ";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(givenValue))
                    .as("알맞은 예외를 발생해야 한다.")
                    .isInstanceOf(NicknameCharacterFailException.class);
        }

        @Test
        @DisplayName("길이가 너무 긴 경우")
        public void tooLong() {
            // Given
            final String koWord = "가나다라마바사";
            final String enWord = "abcdefghijklm";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(koWord))
                    .as("한글 닉네임은 6글자가 초과되면 안된다.")
                    .isInstanceOf(NickNameLengthOutOfRangeFailException.class);

            assertThatThrownBy(() -> nicknameService.create(enWord))
                    .as("영문 닉네임은 12글자가 초과되면 안된다.")
                    .isInstanceOf(NickNameLengthOutOfRangeFailException.class);
        }

        @Test
        @DisplayName("길이가 너무 짧은 경우")
        public void tooShort() {
            // Given
            final String koWord = "가";
            final String enWord = "abc";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(koWord))
                    .as("한글 닉네임은 2글자 이상 입력해야 한다.")
                    .isInstanceOf(NickNameLengthOutOfRangeFailException.class);

            assertThatThrownBy(() -> nicknameService.create(enWord))
                    .as("영문 닉네임은 4글자 이상 입력해야 한다..")
                    .isInstanceOf(NickNameLengthOutOfRangeFailException.class);
        }


        @Test
        @DisplayName("길이는 길지만 숫자로만 채운 경우")
        public void tooLessChar() {
            // Given
            final String givenValue = "111가";

            // When, Then
            assertThatThrownBy(() -> nicknameService.create(givenValue))
                    .as("알맞은 예외를 발생해야 한다.")
                    .isInstanceOf(NicknameCharacterFailException.class);
        }

    }
}