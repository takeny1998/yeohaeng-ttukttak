package com.yeohaeng_ttukttak.server.token.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized.UnauthorizedException;

public final class JwtAlreadyExpiredException extends UnauthorizedException {

    private static final String CODE = "JWT_ALREADY_EXPIRED";

    public JwtAlreadyExpiredException() {
        super(CODE, null);
    }

}
