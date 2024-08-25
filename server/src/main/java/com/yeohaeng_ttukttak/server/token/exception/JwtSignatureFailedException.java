package com.yeohaeng_ttukttak.server.token.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.InternalServerErrorException;

public class JwtSignatureFailedException extends InternalServerErrorException {

    private static final String CODE = "JWT_SIGNATURE_FAILED";

    public JwtSignatureFailedException() {
        this(CODE, null, null);
    }

    public JwtSignatureFailedException(String message, Throwable cause) {
        this(CODE, message, cause);
    }

    protected JwtSignatureFailedException(String code, String message, Throwable cause) {
        super(code, message, cause);
    }

}
