package com.yeohaeng_ttukttak.server.common.exception.exception;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;
import lombok.Getter;

import java.util.Locale;

@Getter
public abstract class ErrorException extends BaseException {

    private static final String code = "ERROR_EXCEPTION";

    private static final String baseMessage =
            "An error occurred while processing request on the server. Please try again later.";

    public ErrorException() {
        this(null);
    }

    protected ErrorException(@Nullable Throwable cause) {
        super(cause);
    }

    public String getCode() {
        return code;
    }

    @Nonnull
    @Override
    public String getBaseMessage() {
        return baseMessage;
    }

    @Override
    public Object[] getArguments(Locale locale) {
        return new Object[0];
    }

}
