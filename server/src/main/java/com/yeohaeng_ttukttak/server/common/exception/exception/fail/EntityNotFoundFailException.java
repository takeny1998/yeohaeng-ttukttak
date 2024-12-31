package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;

public class EntityNotFoundFailException extends FailException implements ArgumentException {

    static final String code = "ENTITY_NOT_FOUND_FAIL";

    private final String entityName;

    public EntityNotFoundFailException(Class<?> clazz) {
        this(code, clazz.getSimpleName());
    }

    public EntityNotFoundFailException(String entityName) {
        this(code, entityName);
    }

    protected EntityNotFoundFailException(String code, String entityName) {
        super(code);
        this.entityName = entityName;
    }


    @Override
    public Object[] args() {
        return new Object[] { entityName };
    }

}
