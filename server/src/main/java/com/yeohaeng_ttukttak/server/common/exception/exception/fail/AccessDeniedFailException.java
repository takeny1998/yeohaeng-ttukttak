package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;

public class AccessDeniedFailException extends FailException implements ArgumentException {

    static final String code = "ACCESS_DENIED_FAIL";

    final Class<?> target;

    public AccessDeniedFailException(Class<?> target) {
        super();
        this.target = target;
    }

    @Override
    public Object[] args() {
        return new Object[] { target.getSimpleName() };
    }
}
