package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.common.aop.aspect.AuthorizationAspect;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AopConfig {

    @Bean
    public AuthorizationAspect authorizationAspect(
            JwtService jwtService,
            UserRepository userRepository,
            HttpServletRequest httpServletRequest) {

        return new AuthorizationAspect(jwtService, userRepository, httpServletRequest);
    }

}
