package com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument;


import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentFailException;
import jakarta.annotation.Nonnull;

import java.util.Locale;

public class ArgumentByteLimitExceededFailException extends ArgumentFailException {

    private static final String baseMessage = "The length of {0} must not exceed {1} characters.";

    private final int byteLimit;

    public ArgumentByteLimitExceededFailException(String field, int byteLimit) {
        super(field);
        this.byteLimit = byteLimit;
    }

    @Override
    public String getBaseMessage() {
        return baseMessage;
    }

    @Override
    public Object[] getArguments(Locale locale) {
        return new Object[]{ super.field, byteLimit, byteLimit / 2 };
    }
}
