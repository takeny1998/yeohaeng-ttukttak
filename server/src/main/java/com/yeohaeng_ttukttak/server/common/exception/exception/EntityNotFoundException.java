package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.http.HttpStatus;

public class EntityNotFoundException extends ApiException {

    private final Class clazz;

    public EntityNotFoundException(Class clazz) {
        this("ENTITY_NOT_FOUND", clazz);
    }

    protected EntityNotFoundException(String code, Class clazz) {
        super(code, HttpStatus.NOT_FOUND);
        this.clazz = clazz;
    }

    public String getEntityName() {
        return clazz.getSimpleName();
    }

}
