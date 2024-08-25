package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple;

import com.yeohaeng_ttukttak.server.token.TokenService;
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

    private final TokenService tokenService;
    private final AppleOAuthProps props;

    private String clientSecret;

    @Scheduled(fixedRate = 14, timeUnit = TimeUnit.DAYS)
    protected void renew() {

        this.clientSecret = tokenService.issueByES256(
                props.privateKey(),
                Duration.ofDays(21),
                Map.of("kid", props.keyId()),
                Map.of("aud", "https://appleid.apple.com",
                        "iss", props.teamId(),
                        "sub", props.clientId())
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
