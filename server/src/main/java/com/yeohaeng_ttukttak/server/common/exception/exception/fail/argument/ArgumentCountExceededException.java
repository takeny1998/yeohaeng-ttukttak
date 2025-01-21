package com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentFailException;
import jakarta.annotation.Nonnull;

import java.util.Locale;

public class ArgumentCountExceededException extends ArgumentFailException {

    private static final String baseMessage = "The number of {0} must not exceed {1}.";

    private final int limit;

    public ArgumentCountExceededException(String field, int limit) {
        super(field);
        this.limit = limit;
    }

    @Override
    public String getBaseMessage() {
        return baseMessage;
    }

    @Override
    public Object[] getArguments(Locale locale) {
        return new Object[] { super.field, limit };
    }
}
