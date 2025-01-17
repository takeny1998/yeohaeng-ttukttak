package com.yeohaeng_ttukttak.server.domain.member.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentFailException;

public final class BadNicknameFailException extends InvalidArgumentFailException {

    private static final String code = "BAD_NICKNAME_FAIL";

    public BadNicknameFailException() {
        super("nickname");
    }

}
