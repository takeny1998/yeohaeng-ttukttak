package com.yeohaeng_ttukttak.server.common.aop.aspect;

import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.token.service.JwtService;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenCommand;
import com.yeohaeng_ttukttak.server.token.service.dto.decode_auth_token.DecodeAuthTokenResult;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import java.util.UUID;

@Slf4j
@Aspect
@RequiredArgsConstructor
public class AuthorizationAspect {

    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final HttpServletRequest httpServletRequest;

    private static final String TOKEN_PREFIX = "Bearer ";

    @Around("execution(* com.yeohaeng_ttukttak.server..*Controller.*(..)) && args(.., com.yeohaeng_ttukttak.server.user.domain.User)")
    public Object doAuth(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        String authorization = httpServletRequest.getHeader("Authorization");

        boolean hasBearerToken = authorization.startsWith(TOKEN_PREFIX);

        Object[] args = proceedingJoinPoint.getArgs();

        if (hasBearerToken) {

            String token = authorization.substring(TOKEN_PREFIX.length());
            DecodeAuthTokenResult result =
                    jwtService.decodeAuthToken(new DecodeAuthTokenCommand(token));

            UUID uuid = UUID.fromString(result.uuid());
            User user = userRepository.findById(uuid)
                    .orElseThrow(() -> new EntityNotFoundException(User.class));

            args[args.length - 1] = user;

        }

        return proceedingJoinPoint.proceed(args);

    }


}
