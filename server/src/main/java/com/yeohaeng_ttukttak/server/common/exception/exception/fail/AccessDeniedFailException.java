package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.EntityTargetException;

public class AccessDeniedFailException extends FailException implements EntityTargetException {

    static final String code = "ACCESS_DENIED_FAIL";

    final Class<?> target;

    public AccessDeniedFailException(Class<?> target) {
        super(code);
        this.target = target;
    }

    @Override
    public Class<?> target() {
        return target;
    }

}
