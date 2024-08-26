package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple;

import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component
@RequiredArgsConstructor
public class AppleClientSecretProvider {

    private final JwtProvidable jwtProvidable;
    private final AppleOAuthProps props;

    private String clientSecret;

    @Scheduled(fixedRate = 14, timeUnit = TimeUnit.DAYS)
    protected void renew() {

        Duration expiration = Duration.ofDays(21);

        Map<String, Object> headerClaims = Map.of("kid", props.keyId());
        Map<String, Object> payloadClaims = Map.of(
                "aud", "https://appleid.apple.com",
                "iss", props.teamId(),
                "sub", props.clientId());

        this.clientSecret = jwtProvidable.issueByES256(
                props.privateKey(),
                expiration,
                headerClaims,
                payloadClaims
        );

        log.debug("Apple Client Secret Issued");
        log.debug("  > clientSecret={}", clientSecret);
    }

    public String clientSecret() {
        if (Objects.isNull(clientSecret)) {
            renew();
        }
        return clientSecret;
    }
}
