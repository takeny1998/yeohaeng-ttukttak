package com.yeohaeng_ttukttak.server.token.config;

import com.yeohaeng_ttukttak.server.token.provider.java_jwt.JavaJwtProvider;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JwtConfig {

    @Bean
    public JwtProvidable jwtProvider(JwtProperties jwtProperties) {
        return new JavaJwtProvider(jwtProperties);
    }

}
