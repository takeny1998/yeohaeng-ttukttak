package com.yeohaeng_ttukttak.server.user.service;

import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.user.service.client.property.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.user.service.token.TokenService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OAuthConfig {

    @Bean
    public OAuthService googleOAuthService(
            GoogleOAuthProvider provider,
            UserRepository userRepository,
            TokenService tokenService) {

        return new OAuthService(provider, userRepository, tokenService);
    }

    @Bean
    public OAuthService appleOAuthService(
            AppleOAuthProvider provider,
            UserRepository userRepository,
            TokenService tokenService) {

        return new OAuthService(provider, userRepository, tokenService);
    }

}
