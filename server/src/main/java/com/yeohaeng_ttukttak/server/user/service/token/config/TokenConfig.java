package com.yeohaeng_ttukttak.server.user.service.token.config;

import com.yeohaeng_ttukttak.server.user.service.token.JavaJwtTokenService;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import com.yeohaeng_ttukttak.server.user.service.token.property.JwtProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TokenConfig {

    @Bean
    public TokenService tokenService(JwtProperties jwtProperties) {
        return new JavaJwtTokenService(jwtProperties);
    }

}
