package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.http.HttpStatus;

public final class AuthorizeFailedException extends ApiException {

    public AuthorizeFailedException() {
        this(null, null);
    }

    public AuthorizeFailedException(String message, Throwable cause) {
        super("AUTHORIZE_FAILED", HttpStatus.UNAUTHORIZED, message, cause);
    }

}
