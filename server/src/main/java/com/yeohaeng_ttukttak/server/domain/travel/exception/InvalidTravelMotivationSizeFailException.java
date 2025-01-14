package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;

public final class InvalidTravelMotivationSizeFailException extends ArgumentNotInRangeFailException {

    public InvalidTravelMotivationSizeFailException() {
        super("motivationTypes", 1, 5);
    }

}
