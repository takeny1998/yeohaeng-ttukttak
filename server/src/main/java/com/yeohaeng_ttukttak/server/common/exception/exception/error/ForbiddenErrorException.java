package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.TargetException;
import org.springframework.http.HttpStatus;

public final class ForbiddenErrorException extends ErrorException implements TargetException {

    final Class<?> target;

    public ForbiddenErrorException(Class<?> target) {
        super(HttpStatus.FORBIDDEN, "FORBIDDEN_ERROR");
        this.target = target;
    }

    @Override
    public Class<?> target() {
        return target;
    }

}
