package com.yeohaeng_ttukttak.server.domain.member.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class InvalidNicknameCharacterFailException extends FailException {

    public InvalidNicknameCharacterFailException() {
        super("INVALID_NICKNAME_CHARACTER_FAIL", "nickname");
    }

}
