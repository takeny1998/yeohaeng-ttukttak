package com.yeohaeng_ttukttak.server.common.exception.exception.fail;


public class ArgumentNotInRangeFailException extends InvalidArgumentFailException {

    private static final String code = "ARGUMENT_NOT_IN_RANGE_FAIL";

    private static final String baseMessage =
            "The argument {0} must be between {1} and {2}. The current value is out of range.";

    protected final Object start, end;

    public ArgumentNotInRangeFailException(String name, Object start, Object end) {
        super(name);
        this.start = start;
        this.end = end;
    }

    public String getCode() {
        return code;
    }

    @Override
    protected String getBaseMessage() {
        return baseMessage;
    }

    @Override
    protected Object[] getArguments() {
        return new Object[]{ super.field, this.start, this.end};
    }

}
