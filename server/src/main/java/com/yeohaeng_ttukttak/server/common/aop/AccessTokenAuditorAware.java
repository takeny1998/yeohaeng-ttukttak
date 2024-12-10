package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.AuthorizationErrorException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.data.domain.AuditorAware;

import java.util.Objects;
import java.util.Optional;

@RequiredArgsConstructor
public class AccessTokenAuditorAware implements AuditorAware<Member> {

    private final SessionFactory sessionFactory;

    @Override
    public Optional<Member> getCurrentAuditor() {
        final AuthenticationContext context =
                AuthenticationContextHolder.getContext();

        if (Objects.isNull(context)) {
            return Optional.empty();
        }

        final Session session = sessionFactory.getCurrentSession();

        return Optional.ofNullable(
                session.bySimpleNaturalId(Member.class).getReference(context.uuid()));
    }
}
