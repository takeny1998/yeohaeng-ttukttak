package com.yeohaeng_ttukttak.server.token.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.internal_server_error.InternalServerErrorException;

public final class JwtSignatureFailedException extends InternalServerErrorException {

    private static final String CODE = "JWT_SIGNATURE_FAILED";

    public JwtSignatureFailedException() {
        super(CODE, null);
    }

    public JwtSignatureFailedException(Throwable cause) {
        super(CODE, cause);
    }

}