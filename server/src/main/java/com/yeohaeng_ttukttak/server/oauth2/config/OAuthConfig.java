package com.yeohaeng_ttukttak.server.oauth2.config;

import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.AppleOAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.GoogleOAuthProvider;
import com.yeohaeng_ttukttak.server.token.provider.JwtProvidable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OAuthConfig {

    @Bean
    public OAuthService googleOAuthService(
            JwtProperties jwtProps,
            GoogleOAuthProvider provider,
            UserRepository userRepository,
            JwtProvidable jwtProvidable) {

        return new OAuthService(jwtProps, provider, userRepository, jwtProvidable);
    }

    @Bean
    public OAuthService appleOAuthService(
            JwtProperties jwtProps,
            AppleOAuthProvider provider,
            UserRepository userRepository,
            JwtProvidable jwtProvidable) {

        return new OAuthService(jwtProps, provider, userRepository, jwtProvidable);
    }

}
