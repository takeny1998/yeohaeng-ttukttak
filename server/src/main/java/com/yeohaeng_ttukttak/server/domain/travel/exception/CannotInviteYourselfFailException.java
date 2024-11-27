package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class CannotInviteYourselfFailException extends FailException {

    public CannotInviteYourselfFailException(String field) {
        super("CANNOT_INVITE_YOURSELF_FAIL", field);
    }

}
