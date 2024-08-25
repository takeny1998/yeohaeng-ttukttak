package com.yeohaeng_ttukttak.server.user.domain;

import com.yeohaeng_ttukttak.server.oauth2.domain.OAuth;
import jakarta.validation.ConstraintViolationException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import java.time.LocalDate;

import static com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider.GOOGLE;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@DataJpaTest
class UserTest {

    @Autowired
    TestEntityManager em;

    record Profile (String name, Gender gender, LocalDate brithDate) {}

    Profile profile;
    OAuth auth;

    @BeforeEach
    void setup() {
        profile = new Profile("Heebeom", Gender.MALE, LocalDate.of(1998, 11, 17));

        auth = new OAuth("710372FA94275862C0B2", GOOGLE);

        em.persist(auth);
    }

    @Test
    void create_success_test() {
        // given
        User user = new User(auth, profile.name(), profile.gender(), profile.brithDate());

        // when
        em.persist(user);

        // then
        assertThat(user.getId()).isNotNull();
        assertThat(user.getAuth()).isEqualTo(auth);
    }

    @Test
    void nickname_null_test() {
        // given
        User user = new User(auth, null, profile.gender(), profile.brithDate());

        // when, then
        assertThatThrownBy(() -> em.persist(user))
                .as("닉네임(nickname)이 null 값이면 빈 검증기 레벨에서 예외가 발생한다.")
                .isInstanceOf(ConstraintViolationException.class);
    }

    @Test
    void gender_null_test() {
        // given
        User user = new User(auth, profile.name(), null, profile.brithDate());

        // when, then
        assertThatThrownBy(() -> em.persist(user))
                .as("성별(gender)이 null 값이면 빈 검증기 레벨에서 예외가 발생한다.")
                .isInstanceOf(ConstraintViolationException.class);
    }

    @Test
    void brith_date_null_test() {
        // given
        User user = new User(auth, profile.name(), profile.gender(), null);

        // when, then
        assertThatThrownBy(() -> em.persist(user))
                .as("생년월일(brithday)이 null 값이면 빈 검증기 레벨에서 예외가 발생한다.")
                .isInstanceOf(ConstraintViolationException.class);
    }
}