package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import lombok.Getter;

@Getter
public abstract class ErrorException extends RuntimeException {

    private final String code;

    public ErrorException(String code, Throwable cause) {
        super(cause);
        this.code = code;
    }

    public ErrorException(String code) {
        this(code, null);
    }

}
