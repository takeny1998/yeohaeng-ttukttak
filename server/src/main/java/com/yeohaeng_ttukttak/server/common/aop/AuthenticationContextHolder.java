package com.yeohaeng_ttukttak.server.common.aop;

import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationContextHolder {

    private static final ThreadLocal<AuthenticationContext> contextHolder = new ThreadLocal<>();

    public static void setContext(AuthenticationContext context) {
        log.debug("[AuthenticationContextHolder.setContext] set context = {}", context);
        contextHolder.set(context);
    }

    public static AuthenticationContext getContext() {
        log.debug("[AuthenticationContextHolder.getContext] get context = {}", contextHolder.get());
        return contextHolder.get();
    }

    public static void clear() {
        contextHolder.remove();
    }

}
