package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public class CityAlreadyAddedTravelFailException extends FailException {

    public CityAlreadyAddedTravelFailException() {
        super("CITY_ALREADY_ADDED_TRAVEL_FAIL");
    }

}
