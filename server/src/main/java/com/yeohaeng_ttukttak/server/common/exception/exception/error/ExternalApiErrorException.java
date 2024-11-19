package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import org.springframework.http.HttpStatus;

public final class ExternalApiErrorException extends ErrorException {

    public ExternalApiErrorException(Throwable cause) {
        super(HttpStatus.BAD_GATEWAY, "EXTERNAL_API_ERROR", cause);
    }

    public ExternalApiErrorException() {
        this(null);
    }

}
