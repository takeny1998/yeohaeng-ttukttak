package com.yeohaeng_ttukttak.server.common.exception.exception;

public class ExternalApiErrorException extends InternalServerErrorException {

    private static final String CODE = "EXTERNAL_API_ERROR";

    public ExternalApiErrorException() {
        this(CODE, null, null);
    }

    public ExternalApiErrorException(String message, Throwable cause) {
        this(CODE, message, cause);
    }

    protected ExternalApiErrorException(String code, String message, Throwable cause) {
        super(code, message, cause);
    }

}
