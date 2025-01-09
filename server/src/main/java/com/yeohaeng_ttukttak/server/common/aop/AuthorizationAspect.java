package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeniedFailException;
import jakarta.persistence.Transient;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
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
import java.util.Set;

@Slf4j
@Aspect
@Configurable(autowire = Autowire.BY_TYPE)
public class AuthorizationAspect {

    @Autowired
    private PermissionManager permissionManager;

    private static final ThreadLocal<AuthorizationContext> contextHolder =
            ThreadLocal.withInitial(() -> new AuthorizationContext(0, null, Set.of()));

    @Pointcut("@annotation(com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization)")
    public void authorization() {}

    @Around("@annotation(authorization) && execution(* *(..))")
    public Object authorize(final ProceedingJoinPoint joinPoint, final Authorization authorization) throws Throwable {

        log.debug("[AuthorizationAspect.authorize] {} {}", joinPoint.getSignature(), permissionManager);

        if (contextHolder.get().depth() == 0) {
            Object resourceId = resolveIdentifier(joinPoint, authorization.target());

            log.debug("[AuthorizationAspect.authorize] resourceId={}", resourceId);
            contextHolder.set( contextHolder.get().init(resourceId));
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

        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();

        final String targetName = target.getSimpleName().toLowerCase();

        final Parameter[] parameters = method.getParameters();

        for (int i = 0; i < parameters.length; i ++) {
            final String paramName = parameters[i].getName().toLowerCase();

            if (!paramName.contains(targetName)) continue;

            resourceId = joinPoint.getArgs()[i];
        }
        return resourceId;
    }
}
