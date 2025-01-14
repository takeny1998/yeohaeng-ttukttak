package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;

public final class InvalidTravelCompanionSizeFailException extends ArgumentNotInRangeFailException {

    public InvalidTravelCompanionSizeFailException() {
        super("companionType", 1, 3);
    }

}
