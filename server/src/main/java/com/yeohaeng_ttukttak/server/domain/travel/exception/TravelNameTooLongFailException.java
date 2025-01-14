package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class TravelNameTooLongFailException extends FailException {

    public TravelNameTooLongFailException() {
        super("TRAVEL_NAME_TOO_LONG_FAIL", "name");
    }
}
