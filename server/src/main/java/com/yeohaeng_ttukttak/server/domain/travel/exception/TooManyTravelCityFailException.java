package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public class TooManyTravelCityFailException extends FailException {

    public TooManyTravelCityFailException() {
        super("TOO_MANY_TRAVEL_CITY_FAIL");
    }

}
