package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

public class InvalidArgumentException extends FailException {

    protected InvalidArgumentException(String code, Throwable cause) {
        super(code, cause);
    }

    public InvalidArgumentException(Throwable cause) {
        this("INVALID_ARGUMENT", cause);
    }

    public InvalidArgumentException() {
        this(null);
    }

}
