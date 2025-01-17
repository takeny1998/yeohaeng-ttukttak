package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;

public final class InternalServerErrorException extends ErrorException {

    private static final String code = "INTERNAL_SERVER_ERROR";

    public InternalServerErrorException(Throwable cause) {
        super(cause);
    }

    public InternalServerErrorException() {
        this(null);
    }

}
