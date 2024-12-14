package com.yeohaeng_ttukttak.server.common.exception.exception.error;

public final class ExternalApiErrorException extends ErrorException {

    static final String code = "EXTERNAL_API_ERROR";

    public ExternalApiErrorException(Throwable cause) {
        super(code, cause);
    }

    public ExternalApiErrorException() {
        this(null);
    }

}
