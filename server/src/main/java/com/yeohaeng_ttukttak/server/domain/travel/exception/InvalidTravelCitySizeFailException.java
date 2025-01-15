package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;

public final class InvalidTravelCitySizeFailException extends ArgumentNotInRangeFailException {

    public InvalidTravelCitySizeFailException() {
        super("cityIds", 1, 10);
    }

}
