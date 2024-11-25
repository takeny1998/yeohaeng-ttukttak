package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.ErrorException;
import org.springframework.http.HttpStatus;

public final class AlreadyJoinedTravelErrorException extends ErrorException {

    static final HttpStatus status = HttpStatus.CONFLICT;
    static final String code = "ALREADY_JOINED_TRAVEL_ERROR";

    public AlreadyJoinedTravelErrorException() {
        super(status, code);
    }

}
