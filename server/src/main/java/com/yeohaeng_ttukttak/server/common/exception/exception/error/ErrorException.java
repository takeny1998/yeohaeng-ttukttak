package com.yeohaeng_ttukttak.server.common.exception.exception.error;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public abstract class ErrorException extends BaseException {

    protected ErrorException(String code, Throwable cause) {
        super(code,  cause);
    }

    protected ErrorException(String code) {
        this(code, null);
    }

}
