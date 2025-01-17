package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelDates;

import static com.yeohaeng_ttukttak.server.common.util.LocalDateUtil.toISODateString;

public final class WillVisitOnNotInTravelPeriodFailException extends ArgumentNotInRangeFailException {

    private static final String code = "WILL_VISIT_ON_NOT_IN_TRAVEL_PERIOD_FAIL";

    public WillVisitOnNotInTravelPeriodFailException(final TravelDates dates) {
        super("willVisitOn", toISODateString(dates.startedOn()), toISODateString(dates.endedOn()));
    }

    @Override
    public String getCode() {
        return code;
    }

}
