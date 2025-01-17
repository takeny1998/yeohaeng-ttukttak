package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;

public final class ExternalApiErrorException extends ErrorException {

    public static final String CODE = "EXTERNAL_API_ERROR";

    public ExternalApiErrorException(Throwable cause) {
        super(cause);
    }

    public ExternalApiErrorException() {
        this(null);
    }

}
