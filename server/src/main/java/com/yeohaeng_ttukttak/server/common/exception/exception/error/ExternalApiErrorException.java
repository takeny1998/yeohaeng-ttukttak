package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;

public final class ExternalApiErrorException extends ErrorException {

    public ExternalApiErrorException(Throwable cause) {
        super(cause);
    }

    public ExternalApiErrorException() {
        this(null);
    }

}
