package com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument;


import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentFailException;
import jakarta.annotation.Nonnull;

import java.util.Locale;

public class ArgumentOutOfRangeFailException extends ArgumentFailException {

    private static final String baseMessage =
            "The argument {0} must be between {1} and {2}. The current value is out of range.";

    protected final Object start, end;

    public ArgumentOutOfRangeFailException(
            String name, Object start, Object end) {
        super(name);
        this.start = start;
        this.end = end;
    }

    @Override
    public String getBaseMessage() {
        return baseMessage;
    }

    @Override
    public Object[] getArguments(Locale locale) {
        return new Object[]{ super.field, this.start, this.end};
    }

}
