package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import org.springframework.http.HttpStatus;

public final class ExternalApiErrorException extends ErrorException {

    static final HttpStatus status = HttpStatus.BAD_GATEWAY;
    static final String code = "EXTERNAL_API_ERROR";

    public ExternalApiErrorException(Throwable cause) {
        super(status, code, cause);
    }

    public ExternalApiErrorException() {
        this(null);
    }

}
