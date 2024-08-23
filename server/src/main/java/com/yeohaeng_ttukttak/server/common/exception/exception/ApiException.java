package com.yeohaeng_ttukttak.server.common.exception.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public abstract class ApiException extends RuntimeException {

    private final String code;
    private final HttpStatus status;

    protected ApiException(String code, HttpStatus status) {
        this.code = code;
        this.status = status;
    }

}
