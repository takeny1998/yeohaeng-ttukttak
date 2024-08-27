package com.yeohaeng_ttukttak.server.common.exception.exception.bad_request;

import com.yeohaeng_ttukttak.server.common.exception.exception.ApiException;
import org.springframework.http.HttpStatus;

public class BadRequestException extends ApiException {

    public BadRequestException() {
        this("BAD_REQUEST");
    }

    protected BadRequestException(String code) {
        super(code, HttpStatus.BAD_REQUEST);
    }

}
