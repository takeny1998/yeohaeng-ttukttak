package com.yeohaeng_ttukttak.server.common.exception.exception;

import jakarta.annotation.Nullable;

import java.util.Locale;

public abstract class FailException extends BaseException {

    private static final String code = "FAIL_EXCEPTION";

    public FailException(@Nullable Throwable cause) {
        super(cause);
    }

    public FailException() {
        this(null);
    }

    public String getCode() {
        return code;
    }

    @Override
    protected Object[] getArguments(Locale locale) {
        return new Object[0];
    }
}
