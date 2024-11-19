package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import org.springframework.http.HttpStatus;

public final class AuthorizationErrorException extends ErrorException {

    public AuthorizationErrorException(Throwable cause) {
        super(HttpStatus.UNAUTHORIZED, "AUTHORIZATION_ERROR", cause);
    }

    public AuthorizationErrorException() {
        this(null);
    }

}
