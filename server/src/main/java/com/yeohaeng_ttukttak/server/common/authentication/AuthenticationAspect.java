package com.yeohaeng_ttukttak.server.common.authentication;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import java.util.Objects;

@Slf4j
@Aspect
@RequiredArgsConstructor
public class AuthenticationAspect {

    private final AccessTokenService accessTokenService;
    private final HttpServletRequest httpServletRequest;

    private static final String TOKEN_PREFIX = "Bearer ";

    @Around("@annotation(com.yeohaeng_ttukttak.server.common.authentication.Authentication)")
    public Object call(ProceedingJoinPoint joinPoint) throws Throwable {

        final String header = httpServletRequest.getHeader("Authorization");

        if (Objects.isNull(header) || !header.startsWith(TOKEN_PREFIX)) {
            throw ExceptionCode.AUTHENTICATION_FAIL.wrap();
        }

        final String encodedToken = header.substring(TOKEN_PREFIX.length());
        final AuthenticationContext context = accessTokenService.decode(encodedToken);

        final Object[] args = joinPoint.getArgs();

        AuthenticationContextHolder.setContext(context);

        for (int i = 0; i < args.length; i++) {
            if (args[i] instanceof AuthenticationContext) {
                args[i] = context;
                break;
            }
        }

        return joinPoint.proceed(args);
    }
}
