package com.yeohaeng_ttukttak.server.common.util;

import com.yeohaeng_ttukttak.server.common.util.my_jwt.MyJwtClaimBuilder;
import com.yeohaeng_ttukttak.server.common.util.my_jwt.MyJwtUtil;
import com.yeohaeng_ttukttak.server.common.util.my_jwt.exception.ExpiredTokenException;
import com.yeohaeng_ttukttak.server.common.util.my_jwt.exception.TokenSignatureNotMatchedException;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@Slf4j
class MyJwtUtilTest {

    @Nested
    @DisplayName("검증 및 해독 테스트")
    class ValidateAndDecode {

        String secret = "heebeom";
        String issuer = "test.yeohaeng-ttukttak.com";
        String email = "heebeom@yeohaeng-ttukttak.com";

        @Test
        void success_test() {

            // Given
            LocalDateTime expiredAt = LocalDateTime.now().plusDays(1);

            Map<String, Object> claim = MyJwtClaimBuilder.create(expiredAt)
                    .issuer(issuer)
                    .addClaim("email", email)
                    .build();

            // when
            String token = MyJwtUtil.issue(secret, claim);
            Map<String, Object> payload = MyJwtUtil.validateAndDecode(secret, token);

            log.info("issued={}", token);
            log.info("decoded={}", payload);

            // then
            assertThat(payload.get("iss")).isEqualTo(issuer);
            assertThat(payload.get("email")).isEqualTo(email);

        }

        @Test
        void expiration_test() {

            // Given
            LocalDateTime expiredAt = LocalDateTime.now().minusDays(1);
            Map<String, Object> claim = MyJwtClaimBuilder.create(expiredAt)
                    .issuer(issuer)
                    .addClaim("email", email)
                    .build();

            // when
            String token = MyJwtUtil.issue(secret, claim);

            // then
            assertThatThrownBy(() -> MyJwtUtil.validateAndDecode(secret, token))
                    .as("토큰 유효기간이 만료된 경우 예외가 발생한다.")
                    .isInstanceOf(ExpiredTokenException.class);

        }

        @Test
        void change_test() {

            // Given
            LocalDateTime expiredAt = LocalDateTime.now().minusDays(1);
            Map<String, Object> claim = MyJwtClaimBuilder.create(expiredAt)
                    .issuer(issuer)
                    .addClaim("email", email)
                    .build();

            // when
            String token = MyJwtUtil.issue(secret, claim);

            String[] parts = token.split("\\.");

            /*
               토큰의 유효 기간을 변조한 값으로 대체
                {
                    "iss": "test.yeohaeng-ttukttak.com",
                    "exp": 1824332140, <-- 2027년 8월 24일로 변조
                    "iat": 1724245740,
                    "email": "heebeom@yeohaeng-ttukttak.com"
                }
            */
            String changedPayload = "eyJpc3MiOiJ0ZXN0Lnllb2hhZW5nLXR0dWt0dGFrLmNvbSIsImV4cCI6MTcyNDQzMjE0MCwiaWF0IjoxNzI0MjQ1NzQwLCJlbWFpbCI6ImhlZWJlb21AeWVvaGFlbmctdHR1a3R0YWsuY29tIn0";
            String changeToken = parts[0] + "." + changedPayload + "." + parts[2];

            // then
            assertThatThrownBy(() -> MyJwtUtil.validateAndDecode(secret, changeToken))
                    .as("토큰이 변조된 경우, 서명 불일치 예외가 발생한다.")
                    .isInstanceOf(TokenSignatureNotMatchedException.class);

        }


    }


}