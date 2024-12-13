package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.AuthorizationErrorException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.http.HttpServletRequest;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.annotation.RequestScope;

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
