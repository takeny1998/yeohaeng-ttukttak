package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.travel.permission.TravelCreatorChecker;
import com.yeohaeng_ttukttak.server.domain.travel.permission.TravelParticipantChecker;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelParticipantRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

@Configuration
public class AopConfig {

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

    @Bean
    public PermissionManager permissionManager(
            final TravelParticipantRepository participantRepository,
            final TravelRepository travelRepository) {

        final PermissionManager permissionManager = new PermissionManager();

        permissionManager.register(new TravelParticipantChecker(participantRepository));
        permissionManager.register(new TravelCreatorChecker(travelRepository));

        return permissionManager;
    }

}
