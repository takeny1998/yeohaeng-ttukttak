package com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized;

public final class AuthorizationExpiredException extends UnauthorizedException {

    public AuthorizationExpiredException() {
        this(null);
    }

    public AuthorizationExpiredException(Throwable cause) {
        super("AUTHORIZATION_EXPIRED", cause);
    }

}
