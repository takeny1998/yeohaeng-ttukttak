package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

public abstract class ArgumentCountExceededException extends ArgumentFailException {

    private static final String baseMessage = "The number of {0} must not exceed {1}.";

    private final int limit;

    public ArgumentCountExceededException(String field, int limit) {
        super(field);
        this.limit = limit;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[] { super.field, limit };
    }
}
