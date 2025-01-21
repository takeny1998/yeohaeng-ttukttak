package com.yeohaeng_ttukttak.server.common.exception.dto;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import jakarta.annotation.Nonnull;
import lombok.Getter;

import java.util.Locale;
import java.util.Objects;


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

    @Override
    public boolean equals(Object obj) {

        if (this == obj) return true;

        if (obj instanceof ExceptionWrapper exceptionWrapper) {
            return this.getCode().equals(exceptionWrapper.getCode());
        }

        return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash(code);
    }

}
