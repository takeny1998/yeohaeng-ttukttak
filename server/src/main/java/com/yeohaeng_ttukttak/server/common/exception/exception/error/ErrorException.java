package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public abstract class ErrorException extends BaseException {

    private final HttpStatus status;

    public ErrorException(HttpStatus status, String code, Throwable cause) {
        super(code,  cause);
        this.status = status;
    }

    public ErrorException(HttpStatus status, String code) {
        this(status, code, null);
    }

}
