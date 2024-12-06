package com.yeohaeng_ttukttak.server.application.auth;

import com.yeohaeng_ttukttak.server.application.auth.service.OAuthLoginService;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.auth.service.RefreshTokenService;
import com.yeohaeng_ttukttak.server.domain.jwt.service.JwtService;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.member.service.NicknameService;
import com.yeohaeng_ttukttak.server.domain.oauth.service.OAuthService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AuthConfig {

    @Bean
    OAuthLoginService appleLoginService(
            OAuthService appleOAuthService,
            JwtService jwtService,
            AccessTokenService accessTokenService,
            RefreshTokenService refreshTokenService,
            NicknameService nicknameService,
            MemberRepository memberRepository
    ) {
        return new OAuthLoginService(
                appleOAuthService, jwtService, accessTokenService, refreshTokenService, nicknameService, memberRepository);
    }

    @Bean
    OAuthLoginService googleLoginService(
            OAuthService googleOAuthService,
            JwtService jwtService,
            AccessTokenService accessTokenService,
            RefreshTokenService refreshTokenService,
            NicknameService nicknameService,
            MemberRepository memberRepository
    ) {
        return new OAuthLoginService(
                googleOAuthService, jwtService, accessTokenService, refreshTokenService, nicknameService, memberRepository);
    }
}
