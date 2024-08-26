package com.yeohaeng_ttukttak.server.oauth2.config;

import com.yeohaeng_ttukttak.server.oauth2.service.OAuthService;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
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
            GoogleOAuthProvider provider,
            UserRepository userRepository,
            JwtService jwtService) {

        return new OAuthService(provider, userRepository, jwtService);
    }

    @Bean
    public OAuthService appleOAuthService(
            GoogleOAuthProvider provider,
            UserRepository userRepository,
            JwtService jwtService) {

        return new OAuthService(provider, userRepository, jwtService);
    }

}
