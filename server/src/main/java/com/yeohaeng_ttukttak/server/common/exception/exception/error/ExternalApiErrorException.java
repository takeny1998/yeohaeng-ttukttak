package com.yeohaeng_ttukttak.server.common.exception.exception.error;

public final class ExternalApiErrorException extends ErrorException {

    private static final String CODE = "EXTERNAL_API_ERROR";

    public ExternalApiErrorException() {
        super(CODE, null);
    }

    public ExternalApiErrorException(Throwable cause) {
        super(CODE, cause);
    }

}
