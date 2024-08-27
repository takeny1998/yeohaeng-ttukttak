package com.yeohaeng_ttukttak.server.common.exception.exception.unauthorized;

public final class AuthorizeFailedException extends UnauthorizedException {

    public AuthorizeFailedException() {
        this(null);
    }

    public AuthorizeFailedException(Throwable cause) {
        super("AUTHORIZE_FAILED", cause);
    }

}
