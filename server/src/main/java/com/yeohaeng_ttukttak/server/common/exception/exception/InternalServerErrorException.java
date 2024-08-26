package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.http.HttpStatus;

public class InternalServerErrorException extends ApiException{

    private static final String CODE = "INTERNAL_SERVER_ERROR";

    public InternalServerErrorException() {
        this(CODE, null, null);
    }

    public InternalServerErrorException(String message, Throwable cause) {
        this(CODE, message, cause);
    }

    protected InternalServerErrorException(String code, String message, Throwable cause) {
        super(code, HttpStatus.INTERNAL_SERVER_ERROR, message, cause);
    }

}
