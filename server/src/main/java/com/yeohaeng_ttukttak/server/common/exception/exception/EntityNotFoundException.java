package com.yeohaeng_ttukttak.server.common.exception.exception;

import org.springframework.http.HttpStatus;

public class EntityNotFoundException extends ApiException {

    private final Class<Object> clazz;

    public EntityNotFoundException(Class<Object> clazz) {
        this("ENTITY_NOT_FOUND", clazz);
    }

    protected EntityNotFoundException(String code, Class<Object> clazz) {
        super(code, HttpStatus.NOT_FOUND);
        this.clazz = clazz;
    }

    public String getEntityName() {
        return clazz.getSimpleName();
    }

}
