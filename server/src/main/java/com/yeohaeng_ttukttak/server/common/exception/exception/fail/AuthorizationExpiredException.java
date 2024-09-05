package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import lombok.Getter;

@Getter
public class AuthorizationExpiredException extends FailException {

    protected AuthorizationExpiredException(String code, Throwable cause) {
        super(code, cause);
    }

    public AuthorizationExpiredException(Throwable cause) {
        this("AUTHORIZATION_EXPIRED", cause);
    }

    public AuthorizationExpiredException() {
        this(null);
    }

}
