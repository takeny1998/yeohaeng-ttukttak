package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

public class InvalidArgumentFailException extends FailException {

    private static final String code = "INVALID_ARGUMENT_FAIL";

    protected InvalidArgumentFailException(String code, String field) {
        super(code, field);
    }

    public InvalidArgumentFailException(String field) {
        this(code, field);
    }

}