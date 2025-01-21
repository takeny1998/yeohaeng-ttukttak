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

    public abstract String getBaseMessage();

    @Override
    public Object[] getArguments(Locale locale) {
        return new Object[]{field};
    }

}
