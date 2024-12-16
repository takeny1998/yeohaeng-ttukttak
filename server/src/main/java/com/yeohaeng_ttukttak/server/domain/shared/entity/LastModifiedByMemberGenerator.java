package com.yeohaeng_ttukttak.server.domain.shared.entity;

import com.yeohaeng_ttukttak.server.common.aop.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import org.hibernate.Session;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.generator.BeforeExecutionGenerator;
import org.hibernate.generator.EventType;

import java.util.EnumSet;

public class LastModifiedByMemberGenerator implements BeforeExecutionGenerator {

    @Override
    public EnumSet<EventType> getEventTypes() {
        return EnumSet.of(EventType.UPDATE);
    }

    @Override
    public Object generate(SharedSessionContractImplementor sessionImpl, Object owner, Object currentValue, EventType eventType) {

        final AuthenticationContext context = AuthenticationContextHolder.getContext();
        final Session session = sessionImpl.getSessionFactory().getCurrentSession();

        return session.bySimpleNaturalId(Member.class).getReference(context.uuid());
    }
}
