package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;

public final class AuthorizationFailException extends FailException {

    public static final String CODE = "AUTHORIZATION_FAIL";

    private static final String DEFAULT_MESSAGE =
            "Your credentials are incorrect or expired. Please log in again.";

    public AuthorizationFailException(Throwable cause) {
        super(cause);
    }

    public AuthorizationFailException() {
        this(null);
    }

    @Override
    protected String getBaseMessage() {
        return DEFAULT_MESSAGE;
    }

}
