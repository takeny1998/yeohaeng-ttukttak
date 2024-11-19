package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.EntityTargetException;
import org.springframework.http.HttpStatus;

public final class ForbiddenErrorException extends ErrorException implements EntityTargetException {

    static final HttpStatus status = HttpStatus.FORBIDDEN;
    static final String code = "FORBIDDEN_ERROR";

    final Class<?> target;

    public ForbiddenErrorException(Class<?> target) {
        super(status, code);
        this.target = target;
    }

    @Override
    public Class<?> target() {
        return target;
    }

}
