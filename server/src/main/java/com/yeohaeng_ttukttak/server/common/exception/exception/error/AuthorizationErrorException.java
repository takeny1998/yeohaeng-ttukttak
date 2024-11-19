package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import org.springframework.http.HttpStatus;

public final class AuthorizationErrorException extends ErrorException {

    static final HttpStatus status = HttpStatus.UNAUTHORIZED;
    static final String code = "AUTHORIZATION_ERROR";

    public AuthorizationErrorException(Throwable cause) {
        super(status, code, cause);
    }

    public AuthorizationErrorException() {
        this(null);
    }

}
