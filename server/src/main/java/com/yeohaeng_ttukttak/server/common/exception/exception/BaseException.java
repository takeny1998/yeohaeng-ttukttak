package com.yeohaeng_ttukttak.server.common.exception.exception;

import jakarta.annotation.Nullable;
import java.util.Locale;

public abstract class BaseException extends RuntimeException {

    protected BaseException(@Nullable Throwable cause) {
        super(cause);
    }

    protected BaseException() {
        this(null);
    }

    public abstract String getBaseMessage();

    public abstract Object[] getArguments(Locale locale);

}
