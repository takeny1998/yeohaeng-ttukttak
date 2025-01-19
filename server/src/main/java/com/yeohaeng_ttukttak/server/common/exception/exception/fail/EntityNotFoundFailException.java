package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;

public class EntityNotFoundFailException extends FailException implements ArgumentException {

    public static final String CODE = "ENTITY_NOT_FOUND_FAIL";

    private final String entityName;

    public EntityNotFoundFailException(Class<?> clazz) {
        this(clazz.getSimpleName());
    }

    public EntityNotFoundFailException(String entityName) {
        super(null);
        this.entityName = entityName;
    }


    @Override
    public Object[] args() {
        return new Object[] { entityName };
    }

}
