package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class TravelPeriodTooLongFailException extends FailException {

    public TravelPeriodTooLongFailException() {
        super("TRAVEL_PERIOD_TOO_LONG_FAIL");
    }

}
