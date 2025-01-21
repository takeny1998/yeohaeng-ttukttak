package com.yeohaeng_ttukttak.server.common.exception.exception;

import jakarta.annotation.Nullable;

import java.util.Locale;

public abstract class FailException extends BaseException {

    public FailException(@Nullable Throwable cause) {
        super(cause);
    }

    public FailException() {
        this(null);
    }

    @Override
    public Object[] getArguments(Locale locale) {
        return new Object[0];
    }
}
