package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;

public final class ArgumentNotInRangeFailException extends InvalidArgumentFailException implements ArgumentException {

    private static final String code = "ARGUMENT_NOT_IN_RANGE_FAIL";

    private final Object start, end;

    public ArgumentNotInRangeFailException(String field, Object start, Object end) {
        super(code, field);
        this.start = start;
        this.end = end;
    }

    @Override
    public Object[] args() {
        return new Object[] { start, end };
    }

}
