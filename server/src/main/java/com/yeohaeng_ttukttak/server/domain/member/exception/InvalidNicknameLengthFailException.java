package com.yeohaeng_ttukttak.server.domain.member.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class InvalidNicknameLengthFailException extends FailException {

    public InvalidNicknameLengthFailException() {
        super("INVALID_NICKNAME_LENGTH_FAIL", "nickname");
    }

}
