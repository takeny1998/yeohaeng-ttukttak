package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

public final class AuthorizationFailException extends FailException {

    static final String code = "AUTHORIZATION_ERROR";

    public AuthorizationFailException(Throwable cause) {
        super(code, null, cause);
    }

    public AuthorizationFailException() {
        this(null);
    }

}
