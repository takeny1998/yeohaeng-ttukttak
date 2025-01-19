package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

public abstract class ArgumentByteOutOfRangeFailException extends ArgumentFailException {

    private static final String baseMessage = "The length of {0} must be between {1} - {2} characters.";

    private final int lowerByteLimit, upperByteLimit;

    protected ArgumentByteOutOfRangeFailException(String field, int lowerByteLimit, int upperByteLimit) {
        super(field);
        this.lowerByteLimit = lowerByteLimit;
        this.upperByteLimit = upperByteLimit;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[] { super.field, this.lowerByteLimit, this.upperByteLimit, this.lowerByteLimit / 2, this.upperByteLimit / 2 };
    }
}
