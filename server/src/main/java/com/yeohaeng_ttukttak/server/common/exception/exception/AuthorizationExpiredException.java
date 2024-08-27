package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.http.HttpStatus;

public final class AuthorizationExpiredException extends ApiException {

    public AuthorizationExpiredException() {
        this(null, null);
    }

    public AuthorizationExpiredException(String message, Throwable cause) {
        super("AUTHORIZATION_EXPIRED", HttpStatus.UNAUTHORIZED, message, cause);
    }

}
