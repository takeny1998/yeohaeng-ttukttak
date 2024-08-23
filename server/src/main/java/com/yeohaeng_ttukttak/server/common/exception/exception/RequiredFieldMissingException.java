package com.yeohaeng_ttukttak.server.common.exception.exception;

public class RequiredFieldMissingException extends BadRequestException {

    private final String field;

    public RequiredFieldMissingException(String field) {
        this("REQUIRED_FIELD_MISSING", field);
    }

    protected RequiredFieldMissingException(String code, String field) {
        super(code);
        this.field = field;
    }

    public String getTarget() {
        return field;
    }
}
