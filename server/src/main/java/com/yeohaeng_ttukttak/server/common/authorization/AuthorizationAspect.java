package com.yeohaeng_ttukttak.server.common.authorization;

import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Authorizable;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.DelegatedAuthorizable;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeniedFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AuthorizationFailException;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;


@Slf4j
@Aspect
@Configurable(autowire = Autowire.BY_TYPE)
public class AuthorizationAspect {

    @Autowired
    private RoleBasedPermissionManager roleBasedPermissionManager;

    @Pointcut("@annotation(com.yeohaeng_ttukttak.server.common.authorization.Authorization)")
    public void authorization() {}

    @Around("@annotation(authorization) && (execution(* *(..)) || execution(*.new(..)))")
    public Object authorizeMethod(final ProceedingJoinPoint joinPoint, final Authorization authorization) throws Throwable {
        final Object target = resolveTarget(joinPoint.getThis());

        final Class<?> targetClass = target.getClass();

        final AuthorizationContext context =
                AuthorizationContextHolder.getContext(targetClass);

        AuthorizationContextHolder.setContext(
                targetClass, context.proceedWith(authorization.requires()));

        final Object result = joinPoint.proceed();

        final AuthorizationContext reverted =
                AuthorizationContextHolder.getContext(targetClass).revert();

        AuthorizationContextHolder.setContext(targetClass, reverted);

        if (reverted.depth() == 0) {

            log.debug("[{}] {}", joinPoint.getSignature(), reverted);

            authorize(target, reverted.getRequires());
        }

        return result;

    }

    private void authorize(final Object target, final CrudOperation[] requires) {

        if (target == null) {
            throw new IllegalStateException("대상 클래스를 찾을 수 없습니다");
        }

        final AuthenticationContext context =
                AuthenticationContextHolder.getContext();

        if (context == null) {
            throw new AuthorizationFailException();
        }

        final boolean permitted =
                roleBasedPermissionManager.check(target, context.uuid(), requires);

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
