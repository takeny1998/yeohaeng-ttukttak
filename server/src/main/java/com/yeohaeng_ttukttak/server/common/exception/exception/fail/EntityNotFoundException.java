package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import lombok.Getter;

public class EntityNotFoundException extends FailException {

    public <T> EntityNotFoundException(Class<T> clazz) {
        super(String.format("%s_NOT_FOUND", clazz.getSimpleName().toUpperCase()));
    }

}
