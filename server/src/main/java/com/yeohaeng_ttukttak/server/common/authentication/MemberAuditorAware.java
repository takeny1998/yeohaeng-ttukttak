package com.yeohaeng_ttukttak.server.common.authentication;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AuthorizationFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.AuditorAware;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@RequiredArgsConstructor
public class MemberAuditorAware implements AuditorAware<Member> {

    private final MemberRepository memberRepository;

    @Override
    @Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
    public Optional<Member> getCurrentAuditor() {
        final AuthenticationContext context =
                AuthenticationContextHolder.getContext();

        final Member member = context.member()
                .orElseGet(() -> {
                    final Member foundMember = memberRepository.findByUuid(context.uuid())
                            .orElseThrow(AuthorizationFailException::new);

                    AuthenticationContextHolder.setContext(AuthenticationContext.of(foundMember));

                    return foundMember;
                });

        return Optional.of(member);
    }

}
