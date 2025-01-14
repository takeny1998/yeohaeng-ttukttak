package com.yeohaeng_ttukttak.server.common.authorization;

import java.util.*;

public class AuthorizationContextHolder {

    private static final ThreadLocal<Map<Class<?>, AuthorizationContext>> contextHolder =
            ThreadLocal.withInitial(HashMap::new);

    public static void setContext(Class<?> type, AuthorizationContext context) {

        final Map<Class<?>, AuthorizationContext> contextMap =
                contextHolder.get();

        if (context.depth() == 0) {
            contextMap.remove(type);
        } else {
            contextMap.put(type, context);
        }

        contextHolder.set(contextMap);

    }

    public static AuthorizationContext getContext(Class<?> type) {

        final Map<Class<?>, AuthorizationContext> contextMap =
                contextHolder.get();

        final AuthorizationContext context = contextMap.get(type);

        if (Objects.isNull(context)) {
            return new AuthorizationContext();
        }

        return context;
    }

}
