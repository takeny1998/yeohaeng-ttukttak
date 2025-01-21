package com.yeohaeng_ttukttak.server.common.exception.dto;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import jakarta.annotation.Nonnull;
import lombok.Getter;

import java.util.Locale;


public abstract class ExceptionWrapper extends BaseException {

    @Getter
    private final String code;

    private final BaseException instance;

    protected ExceptionWrapper(
            final String code, final BaseException instance) {

        this.code = code;
        this.instance = instance;
    }

    @Override
    public String getMessage(@Nonnull Locale locale) {
        return instance.getMessage(locale);
    }

    @Nonnull
    @Override
    protected String getBaseMessage() {
        throw new UnsupportedOperationException();
    }

    @Override
    protected Object[] getArguments(Locale locale) {
        throw new UnsupportedOperationException();
    }

    protected BaseException getInstance() {
        return instance;
    }

}
