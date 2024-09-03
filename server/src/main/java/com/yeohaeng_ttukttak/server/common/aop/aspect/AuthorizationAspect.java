package com.yeohaeng_ttukttak.server.common.aop.aspect;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenResult;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@Aspect
@RequiredArgsConstructor
public class AuthorizationAspect {

    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final HttpServletRequest httpServletRequest;

    private static final String TOKEN_PREFIX = "Bearer ";

    @Pointcut("execution(* com.yeohaeng_ttukttak.server..*Controller.*(..))")
    private void controllerPointcut() {}

    @Around("controllerPointcut()")
    public Object doAuth(final ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        final Object[] args = proceedingJoinPoint.getArgs();
        final Method method = ((MethodSignature) proceedingJoinPoint.getSignature()).getMethod();


        final Class<?>[] parameterTypes = method.getParameterTypes();
        final Annotation[][] parameterAnnotations = method.getParameterAnnotations();

        boolean hasTargetParameter = false;
        int targetParameterIndex = 0;

        for (int i = 0; i < args.length; i ++) {

            if (!parameterTypes[i].equals(String.class)) continue;

            final boolean isTargetParameter = Arrays.stream(parameterAnnotations[i])
                    .anyMatch((annotation -> annotation instanceof Authorization));

            if (isTargetParameter) {
                hasTargetParameter = true;
                targetParameterIndex = i;
                break;
            }
        }

        if (!hasTargetParameter) return proceedingJoinPoint.proceed();

        final String header = httpServletRequest.getHeader("Authorization");
        if (Objects.isNull(header)) return proceedingJoinPoint.proceed();

        final boolean hasBearerToken = header.startsWith(TOKEN_PREFIX);
        if (!hasBearerToken) return proceedingJoinPoint.proceed();


        final String token = header.substring(TOKEN_PREFIX.length());
        final DecodeAuthTokenResult result =
                jwtService.decodeAuthToken(new DecodeAuthTokenCommand(token));

        log.debug("[AuthorizationAspect] decoded={}", result);

        args[targetParameterIndex] = result.userId();

        return proceedingJoinPoint.proceed(args);

    }


}
