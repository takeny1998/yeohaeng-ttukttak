package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;

public class TooManyEntityFailException extends FailException implements ArgumentException {

    private final Class<?> clazz;

    private final int maximum;

    public TooManyEntityFailException(Class<?> clazz, int maximum) {
        super("TOO_MANY_ENTITY_FAIL");
        this.clazz = clazz;
        this.maximum = maximum;
    }

    @Override
    public Object[] args() {
        return new Object[] { clazz.getSimpleName(), maximum };
    }

}
