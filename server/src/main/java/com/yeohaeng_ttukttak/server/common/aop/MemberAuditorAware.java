package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AuthorizationFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.engine.spi.EntityEntry;
import org.hibernate.engine.spi.SessionImplementor;
import org.springframework.data.domain.AuditorAware;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.Map.Entry;
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
