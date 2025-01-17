package com.yeohaeng_ttukttak.server.common.exception.exception;

import lombok.Getter;

@Getter
public class ErrorException extends BaseException {

    private static final String code = "ERROR_EXCEPTION";

    private static final String baseMessage =
            "An error occurred while processing request on the server. Please try again later.";

    protected ErrorException(Throwable cause) {
        super(cause);
    }

    protected ErrorException() {
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
