package com.yeohaeng_ttukttak.server.common.exception.exception;

public abstract class BaseException extends RuntimeException {

    private final String code;

    protected BaseException(String code, Throwable cause) {
        super(cause);
        this.code = code;
    }

    protected BaseException(String code) {
        this(code,  null);
    }

    public String code() {
        return code;
    }
}
