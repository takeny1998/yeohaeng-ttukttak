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

    @Nonnull
    @Override
    public final String getBaseMessage() {
        return instance.getBaseMessage();
    }

    @Override
    public Object[] getArguments(Locale locale) {
        return instance.getArguments(locale);
    }

    protected BaseException getInstance() {
        return instance;
    }

}
