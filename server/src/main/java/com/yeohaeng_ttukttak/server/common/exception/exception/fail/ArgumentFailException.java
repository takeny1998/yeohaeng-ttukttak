package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import jakarta.annotation.Nonnull;
import lombok.Getter;

import java.util.Locale;


@Getter
public abstract class ArgumentFailException extends FailException {

    protected final String field;

    public ArgumentFailException(String field) {
        super(null);
        this.field = field;
    }

    @Nonnull
    protected abstract String getBaseMessage();

    @Override
    protected Object[] getArguments(Locale locale) {
        return new Object[]{field};
    }

}
