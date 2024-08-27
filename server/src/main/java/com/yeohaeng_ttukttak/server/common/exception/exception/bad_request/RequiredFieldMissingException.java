package com.yeohaeng_ttukttak.server.common.exception.exception.bad_request;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.TargetException;

public final class RequiredFieldMissingException extends BadRequestException implements TargetException {

    private final String field;

    public RequiredFieldMissingException(String field) {
        this("REQUIRED_FIELD_MISSING", field);
    }

    private RequiredFieldMissingException(String code, String field) {
        super(code);
        this.field = field;
    }

    @Override
    public String getTarget() {
        return field;
    }

}
