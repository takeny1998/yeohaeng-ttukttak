package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import lombok.Getter;

@Getter
public abstract class FailException extends BaseException {

    private final String field;

    protected FailException(String code, String field) {
        super(code);
        this.field = field;
    }

}
