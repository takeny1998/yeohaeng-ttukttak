package com.yeohaeng_ttukttak.server.common.authentication;

import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

@Configuration
public class AuthenticationConfig {

    @Bean
    public AuthenticationAspect authenticationAspect(
            AccessTokenService accessTokenService,
            HttpServletRequest httpServletRequest
    ) {
        return new AuthenticationAspect(accessTokenService, httpServletRequest);
    }

    @Bean
    public AuditorAware<Member> memberAuditorAware(MemberRepository memberRepository) {
        return new MemberAuditorAware(memberRepository);
    }

}
