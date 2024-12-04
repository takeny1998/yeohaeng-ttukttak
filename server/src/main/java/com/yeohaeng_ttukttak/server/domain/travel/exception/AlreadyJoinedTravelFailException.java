package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class AlreadyJoinedTravelFailException extends FailException {

    static final String code = "ALREADY_JOINED_TRAVEL_FAIL";

    public AlreadyJoinedTravelFailException(String field) {
        super(code, field);
    }

}
