package com.yeohaeng_ttukttak.server.token.config;

import com.yeohaeng_ttukttak.server.token.JavaJwtTokenService;
import com.yeohaeng_ttukttak.server.token.TokenService;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TokenConfig {

    @Bean
    public TokenService tokenService(JwtProperties jwtProperties) {
        return new JavaJwtTokenService(jwtProperties);
    }

}
