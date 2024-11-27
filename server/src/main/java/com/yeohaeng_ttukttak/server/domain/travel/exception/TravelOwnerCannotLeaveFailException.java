package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class TravelOwnerCannotLeaveFailException extends FailException {

    public TravelOwnerCannotLeaveFailException(String field) {
        super("TRAVEL_OWNER_CANNOT_LEAVE_FAIL", field);
    }

}
