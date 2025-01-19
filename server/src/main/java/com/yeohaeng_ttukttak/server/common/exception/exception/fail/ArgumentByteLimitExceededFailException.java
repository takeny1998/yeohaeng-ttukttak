package com.yeohaeng_ttukttak.server.common.exception.exception.fail;


public abstract class ArgumentByteLimitExceededFailException extends ArgumentFailException {

    private static final String baseMessage = "The length of {0} must not exceed {1} characters.";

    private final int byteLimit;

    public ArgumentByteLimitExceededFailException( String field, int byteLimit) {
        super(field);
        this.byteLimit = byteLimit;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[]{ super.field, byteLimit, byteLimit / 2 };
    }
}
