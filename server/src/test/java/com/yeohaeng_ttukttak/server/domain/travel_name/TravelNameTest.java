package com.yeohaeng_ttukttak.server.domain.travel_name;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelName;
import com.yeohaeng_ttukttak.server.domain.travel.exception.InvalidTravelNameCharacterFailException;
import com.yeohaeng_ttukttak.server.domain.travel.exception.TravelNameTooLongFailException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.*;

class TravelNameTest {

    @Nested
    class ValidateInputNameTest {

        @Test
        @DisplayName("성공")
        void SUCCESS() {
            // when
            final String inputName = "여행 이름, Travel 123";

            // given
            final TravelName travelName = new TravelName(inputName, List.of());

            // then
            assertThat(travelName.name())
                    .isEqualTo(inputName);
        }

        @Test
        @DisplayName("이름이 너무 길 경우 예외를 발생한다.")
        void TOO_LONG_NAME() {
            // when
            final String koreanName = "여행을 계획 하며 새로운 경험을 찾는 것이 중요합니다, 그리고 여행은 삶의 소중한 경험입니다, 여행은 새로운 문화와 사람들을 만나는 즐거움입니다";
            final String englishName = "It is important to seek new experiences while planning a trip, and traveling is a valuable experience in life, traveling is a pleasure to meet new cultures and people";

            // given
            final Throwable koreanThrown = catchThrowable(() ->
                    new TravelName(koreanName, List.of()));

            final Throwable englishThrown = catchThrowable(() ->
                    new TravelName(englishName, List.of()));

            // then
            assertThat(koreanThrown)
                    .as("한글은 최대 50자까지 입력할 수 있다.")
                    .isInstanceOf(TravelNameTooLongFailException.class);

            assertThat(englishThrown)
                    .as("영어는 최대 100자까지 입력할 수 있다.")
                    .isInstanceOf(TravelNameTooLongFailException.class);
        }

        @Test
        @DisplayName("이름에 잘못된 문자가 있을 경우 예외를 발생한다.")
        void INVALID_CHARACTER() {
            // when
            final String jaEnumName = "여행 이름ㅋ";
            final String specialCharName = "여.?행";

            // given
            final Throwable jaEumThrown = catchThrowable(() ->
                    new TravelName(jaEnumName, List.of()));

            final Throwable specialCharThrown = catchThrowable(() ->
                    new TravelName(specialCharName, List.of()));

            // then
            assertThat(jaEumThrown)
                    .as("완성된 한글 문자여야 한다.")
                    .isInstanceOf(InvalidTravelNameCharacterFailException.class);

            assertThat(specialCharThrown)
                    .as("한글 혹은 영어, 공백, 숫자, 콤마만 사용 가능하다.")
                    .isInstanceOf(InvalidTravelNameCharacterFailException.class);
        }

    }

}