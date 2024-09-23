package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import lombok.Getter;

@Getter
public class InvalidAuthorizationException extends FailException {

    protected InvalidAuthorizationException(String code, Throwable cause) {
        super(code, cause);
    }

    public InvalidAuthorizationException(Throwable cause) {
        this("INVALID_AUTHORIZATION", cause);
    }

    public InvalidAuthorizationException() {
        this(null);
    }

}
