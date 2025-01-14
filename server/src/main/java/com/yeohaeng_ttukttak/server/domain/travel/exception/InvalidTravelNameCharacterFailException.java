package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class InvalidTravelNameCharacterFailException extends FailException {

    public InvalidTravelNameCharacterFailException() {
        super("INVALID_TRAVEL_NAME_CHARACTER_FAIL", "name");
    }
}
