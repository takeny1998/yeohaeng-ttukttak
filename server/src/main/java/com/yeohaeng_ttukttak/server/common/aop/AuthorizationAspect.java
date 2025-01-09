package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import java.util.List;
import java.util.Set;

@Slf4j
@Aspect
public class AuthorizationAspect {

    private static final ThreadLocal<AuthorizationContext> contextHolder
            = ThreadLocal.withInitial(() -> new AuthorizationContext(0, Set.of()));

    @Around("@annotation(com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization) && @annotation(authorization)")
    public Object call(final ProceedingJoinPoint joinPoint, final Authorization authorization) throws Throwable {

        if (contextHolder.get().depth() == 0) {

            log.debug("{}", contextHolder.get().requires());

            return joinPoint.proceed();
        }

        contextHolder.set(contextHolder.get().proceed(authorization.requires()));

        final Object result = joinPoint.proceed();

        contextHolder.set(contextHolder.get().revert());

        return result;
    }

}
