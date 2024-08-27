package com.yeohaeng_ttukttak.server.common.exception.exception;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.TargetException;
import org.springframework.http.HttpStatus;

public class EntityNotFoundException extends ApiException implements TargetException {

    private final Class target;

    public EntityNotFoundException(Class clazz) {
        this("ENTITY_NOT_FOUND", clazz);
    }

    protected EntityNotFoundException(String code, Class clazz) {
        super(code, HttpStatus.NOT_FOUND);
        this.target = clazz;
    }

    @Override
    public String getTarget() {
        return target.getSimpleName();
    }

}
