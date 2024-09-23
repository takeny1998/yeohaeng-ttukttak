package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import java.util.Objects;

@Aspect
@RequiredArgsConstructor
public class AuthorizationAspect {

    private final AccessTokenService accessTokenService;
    private final HttpServletRequest httpServletRequest;

    private static final String TOKEN_PREFIX = "Bearer ";

    @Around("Pointcuts.controllerPointcut() && Pointcuts.authorizationPointcut()")
    public Object call(ProceedingJoinPoint joinPoint) throws Throwable {

        final String header = httpServletRequest.getHeader("Authorization");
        if (Objects.isNull(header) || !header.startsWith(TOKEN_PREFIX)) {
            return joinPoint.proceed();
        }

        final String encodedToken = header.substring(TOKEN_PREFIX.length());
        final AccessTokenDto accessTokenDto = accessTokenService.decode(encodedToken);

        final Object[] args = joinPoint.getArgs();

        for (int i = 0; i < args.length; i++) {
            final boolean isTargetParameter = !(args[i] instanceof AccessTokenDto);

            if (!isTargetParameter) continue;
            args[i] = accessTokenDto;
        }

        return joinPoint.proceed(args);
    }
}
