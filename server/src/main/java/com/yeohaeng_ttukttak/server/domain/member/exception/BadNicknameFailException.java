package com.yeohaeng_ttukttak.server.domain.member.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class BadNicknameFailException extends FailException {

    public BadNicknameFailException() {
        super("BAD_NICKNAME_FAIL", "nickname");
    }

}
