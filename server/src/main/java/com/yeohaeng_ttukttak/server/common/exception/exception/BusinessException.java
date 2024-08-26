package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.http.HttpStatus;

public abstract class BusinessException extends ApiException {

    protected BusinessException(String code, HttpStatus status) {
        super(code, status, null, null);
    }

}
