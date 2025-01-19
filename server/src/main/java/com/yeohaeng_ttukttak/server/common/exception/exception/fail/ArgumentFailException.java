package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import lombok.Getter;


@Getter
public abstract class ArgumentFailException extends FailException {

    private static final String baseMessage =
            "An invalid argument {0} has been provided. Please check the input values and try again.";

    protected final String field;

    public ArgumentFailException(String field) {
        super(null);
        this.field = field;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[]{field};
    }

}
