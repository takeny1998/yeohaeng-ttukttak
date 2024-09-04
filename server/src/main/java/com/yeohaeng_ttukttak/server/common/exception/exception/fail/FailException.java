package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import lombok.Getter;

@Getter
public abstract class FailException extends RuntimeException {

    private final String code;

    public FailException(String code, Throwable cause) {
        super(cause);
        this.code = code;
    }

    public FailException(String code) {
        this(code, null);
    }

}
