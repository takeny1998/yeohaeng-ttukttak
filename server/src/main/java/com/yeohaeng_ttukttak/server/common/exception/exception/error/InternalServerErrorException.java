package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;

public final class InternalServerErrorException extends ErrorException {

    public InternalServerErrorException(Throwable cause) {
        super(cause);
    }

    public InternalServerErrorException() {
        this(null);
    }

}
