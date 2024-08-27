package com.yeohaeng_ttukttak.server.common.exception.exception.internal_server_error;

import com.yeohaeng_ttukttak.server.common.exception.exception.ApiException;
import org.springframework.http.HttpStatus;

public class InternalServerErrorException extends ApiException {

    private static final String CODE = "INTERNAL_SERVER_ERROR";

    public InternalServerErrorException() {
        this(CODE, null);
    }

    public InternalServerErrorException( Throwable cause) {
        this(CODE, cause);
    }

    protected InternalServerErrorException(String code, Throwable cause) {
        super(code, HttpStatus.INTERNAL_SERVER_ERROR, cause);
    }

}
