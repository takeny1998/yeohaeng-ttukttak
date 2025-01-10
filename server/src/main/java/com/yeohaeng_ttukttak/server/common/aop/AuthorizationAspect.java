package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeniedFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.shared.interfaces.Authorizable;
import com.yeohaeng_ttukttak.server.domain.shared.interfaces.DelegatedAuthorizable;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;


@Slf4j
@Aspect
@Configurable(autowire = Autowire.BY_TYPE)
public class AuthorizationAspect {

    @Autowired
    private RoleBasedPermissionManager roleBasedPermissionManager;

    @Pointcut("@annotation(com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization)")
    public void authorization() {}

    @Before("@annotation(authorization) && (execution(* *(..)))")
    public void authorizeMethod(final JoinPoint joinPoint, final Authorization authorization) {
        authorize(joinPoint, authorization);
    }

    @After("@annotation(authorization) && (execution(*.new(..)))")
    public void authorizeConstructor(final JoinPoint joinPoint, final Authorization authorization) {
        authorize(joinPoint, authorization);
    }

    private void authorize(JoinPoint joinPoint, Authorization authorization) {
        final Object target = resolveTarget(joinPoint.getThis());

        if (target == null) {
            throw new IllegalStateException("대상 클래스를 찾을 수 없습니다");
        }

        log.debug("[AuthorizationAspect.authorize] {} resolved = {}", joinPoint.getSignature(), target);

        final AuthenticationContext context =
                AuthenticationContextHolder.getContext();

        final boolean permitted =
                roleBasedPermissionManager.check(target, context.uuid(), authorization.requires());

        log.debug("[AuthorizationAspect.authorize] {} permitted = {}", joinPoint.getSignature(), permitted);

        if (!permitted) {
            throw new AccessDeniedFailException(target.getClass());
        }
    }

    private Object resolveTarget(final Object target) {

        if (target instanceof Authorizable authorizable) {
            return authorizable;
        }

        if (target instanceof DelegatedAuthorizable<?> authorizable) {
            return authorizable.resolve();
        }

        return null;
    }

}
