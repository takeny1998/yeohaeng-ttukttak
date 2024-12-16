package com.yeohaeng_ttukttak.server.common.exception.exception.error;

public final class InternalServerErrorException extends ErrorException {

    private static final String code = "INTERNAL_SERVER_ERROR";

    public InternalServerErrorException(Throwable cause) {
        super(code, cause);
    }

    public InternalServerErrorException() {
        this(null);
    }

}
