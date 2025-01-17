package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;

public class InvalidArgumentFailException extends FailException {

    private static final String code = "INVALID_ARGUMENT_FAIL";

    private static final String baseMessage =
            "An invalid argument '{0}' has been provided. Please check the input values and try again.";

    protected final String name;

    public InvalidArgumentFailException(String name) {
        this.name = name;
    }

    @Override
    public String getCode() {
        return code;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[]{ name };
    }

}
