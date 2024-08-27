package com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized;

import com.yeohaeng_ttukttak.server.common.exception.exception.ApiException;
import org.springframework.http.HttpStatus;

public class UnauthorizedException extends ApiException {

    private static final String CODE = "UNAUTHORIZED";

    public UnauthorizedException() {
        this(CODE, null);
    }

    public UnauthorizedException(Throwable cause) {
        this(CODE, cause);
    }

    protected UnauthorizedException(String code, Throwable cause) {
        super(code, HttpStatus.UNAUTHORIZED, cause);
    }

}
