package com.yeohaeng_ttukttak.server.domain.member.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentFailException;

public final class InvalidNicknameLengthFailException extends InvalidArgumentFailException {

    private static final String code = "INVALID_NICKNAME_LENGTH_FAIL";

    public InvalidNicknameLengthFailException() {
        super("nickname");
    }

}
