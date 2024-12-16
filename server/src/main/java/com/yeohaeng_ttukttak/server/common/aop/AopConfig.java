package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AopConfig {

    @Bean
    public AuthorizationAspect authorizationAspect(
            AccessTokenService accessTokenService,
            HttpServletRequest httpServletRequest
    ) {
        return new AuthorizationAspect(accessTokenService, httpServletRequest);
    }

}
