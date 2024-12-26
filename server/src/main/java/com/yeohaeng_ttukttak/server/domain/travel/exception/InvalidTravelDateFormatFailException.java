package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class InvalidTravelDateFormatFailException extends FailException {

    public InvalidTravelDateFormatFailException() {
        super("INVALID_TRAVEL_DATE_FORMAT_FAIL");
    }

}
