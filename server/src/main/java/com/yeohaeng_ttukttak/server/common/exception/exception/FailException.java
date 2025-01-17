package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

import java.util.Locale;
import java.util.Map;

@Configurable(autowire = Autowire.BY_TYPE, preConstruction = true)
public class FailException extends BaseException implements DomainException {

    private static final String code = "FAIL_EXCEPTION";

    private static final String baseMessage =
            "The request data does not meet the required pre-conditions or post-conditions. Please review the request data and try again.";

    protected FailException(Throwable cause) {
        super(cause);
    }

    protected FailException() {
        this(null);
    }

    public String getCode() {
        return code;
    }

    public Map<String, String> toErrorObject(Locale locale) {
        return Map.of("code", getCode(), "message", getMessage(locale));
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[0];
    }
}
