package com.yeohaeng_ttukttak.server.common.exception.exception.fail;


public abstract class ArgumentOutOfRangeFailException extends ArgumentFailException {

    private static final String baseMessage =
            "The argument {0} must be between {1} and {2}. The current value is out of range.";

    protected final Object start, end;

    protected ArgumentOutOfRangeFailException(
            String name, Object start, Object end) {
        super(name);
        this.start = start;
        this.end = end;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[]{ super.field, this.start, this.end};
    }

}
