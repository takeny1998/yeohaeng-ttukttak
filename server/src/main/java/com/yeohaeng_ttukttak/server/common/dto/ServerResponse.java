package com.yeohaeng_ttukttak.server.common.dto;

import com.yeohaeng_ttukttak.server.common.exception.dto.ExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.exception.dto.FailExceptionDto;
import com.yeohaeng_ttukttak.server.common.exception.dto.FailExceptionWrapper;

public abstract class ServerResponse {

    public static ServerResponse of (final ExceptionWrapper wrapper, final String message) {

        if (wrapper instanceof FailExceptionWrapper failWrapper) {
            return new ServerFailResponse(
                    new FailExceptionDto(failWrapper.getCode(), message, failWrapper.getField()));
        }

        return new ServerErrorResponse(
                wrapper.getCode(), message);
    }

}
