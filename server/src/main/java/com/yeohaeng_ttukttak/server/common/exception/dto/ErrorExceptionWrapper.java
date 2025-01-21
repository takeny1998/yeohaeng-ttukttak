package com.yeohaeng_ttukttak.server.common.exception.dto;

import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;

public class ErrorExceptionWrapper extends ExceptionWrapper {

    public ErrorExceptionWrapper(String code, ErrorException instance) {
        super(code, instance);
    }

    @Override
    public ErrorException getInstance() {
        return (ErrorException) super.getInstance();
    }

}
