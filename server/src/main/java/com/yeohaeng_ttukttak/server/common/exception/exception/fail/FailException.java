package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import lombok.Getter;

public abstract class FailException extends BaseException {

    private final String field;

    protected FailException(String code, String field, Throwable cause) {
        super(code, cause);
        this.field = field;
    }

    protected FailException(String code, String field) {
        this(code, field, null);
    }

    protected FailException(String code) {
        this(code, null);
    }

    public String field() {
        return field;
    }

}
