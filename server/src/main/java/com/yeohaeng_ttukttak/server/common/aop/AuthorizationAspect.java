package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.aop.annotation.AuthorizeTarget;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeniedFailException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

@Slf4j
@Aspect
@Configurable(autowire = Autowire.BY_TYPE)
public class AuthorizationAspect {

    @Autowired
    private PermissionManager permissionManager;

    private static final ThreadLocal<AuthorizationContext> contextHolder =
            ThreadLocal.withInitial(AuthorizationContext::init);

    @Pointcut("@annotation(com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization)")
    public void authorization() {}

    @Around("@annotation(authorization) && execution(* *(..))")
    public Object authorize(final ProceedingJoinPoint joinPoint, final Authorization authorization) throws Throwable {

        log.debug("[AuthorizationAspect.authorize] {} {}", joinPoint.getSignature(), permissionManager);

        final Object resourceId = resolveIdentifier(joinPoint, authorization.target());

        if (resourceId != null) {
            log.debug("[AuthorizationAspect.authorize] resourceId={}", resourceId);
            contextHolder.set(contextHolder.get().resolveId(resourceId));
        }

        contextHolder.set(contextHolder.get().proceed(authorization.requires()));

        final Object result = joinPoint.proceed();

        contextHolder.set(contextHolder.get().revert());

        final AuthorizationContext context = contextHolder.get();

        if (context.depth() == 0) {
            final boolean isPermitted = permissionManager.check(context.resourceId(),
                    AuthenticationContextHolder.getContext().uuid(),
                    authorization.target(),
                    context.requires().toArray(new CrudPermission[]{}));

            if (!isPermitted) {
                throw new AccessDeniedFailException(authorization.target());
            }
        }

        return result;
    }

    private Object resolveIdentifier(ProceedingJoinPoint joinPoint, Class<?> target) {

        Object resourceId = null;

        final Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();

        final Parameter[] parameters = method.getParameters();

        for (int i = 0; i < parameters.length; i ++) {
            final AuthorizeTarget declaredAnnotation =
                    parameters[i].getDeclaredAnnotation(AuthorizeTarget.class);

            if (declaredAnnotation == null) continue;
            if (!declaredAnnotation.target().equals(target)) continue;

            resourceId = joinPoint.getArgs()[i];
        }

        return resourceId;
    }
}
