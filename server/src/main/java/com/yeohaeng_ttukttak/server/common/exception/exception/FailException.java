package com.yeohaeng_ttukttak.server.common.exception.exception;

public abstract class FailException extends BaseException {

    private static final String code = "FAIL_EXCEPTION";

    private static final String baseMessage =
            "The request data does not meet the required pre-conditions or post-conditions. Please review the request data and try again.";

    public FailException(Throwable cause) {
        super(cause);
    }

    public FailException() {
        this(null);
    }

    public String getCode() {
        return code;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[0];
    }
}
