package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;

public final class TravelPeriodTooLongFailException extends FailException {

    private static final String code = "TRAVEL_PERIOD_TOO_LONG_FAIL";

    public TravelPeriodTooLongFailException() {
        super();
    }

}
