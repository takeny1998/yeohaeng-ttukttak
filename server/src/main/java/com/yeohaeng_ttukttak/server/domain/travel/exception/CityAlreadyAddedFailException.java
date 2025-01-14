package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityAlreadyAddedFailException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;


public class CityAlreadyAddedFailException extends EntityAlreadyAddedFailException {

    public CityAlreadyAddedFailException() {
        super(City.class);
    }

}
