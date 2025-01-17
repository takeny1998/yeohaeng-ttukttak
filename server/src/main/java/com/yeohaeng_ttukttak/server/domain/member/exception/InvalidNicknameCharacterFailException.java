package com.yeohaeng_ttukttak.server.domain.member.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentFailException;

public final class InvalidNicknameCharacterFailException extends InvalidArgumentFailException {

    private static final String code = "INVALID_NICKNAME_CHARACTER_FAIL";

    public InvalidNicknameCharacterFailException() {
        super("nickname");
    }

}
