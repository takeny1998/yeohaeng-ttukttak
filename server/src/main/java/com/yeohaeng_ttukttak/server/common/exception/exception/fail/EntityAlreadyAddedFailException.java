package com.yeohaeng_ttukttak.server.common.exception.exception.fail;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;

public class EntityAlreadyAddedFailException extends FailException implements ArgumentException {

    private final Class<?> clazz;

    public EntityAlreadyAddedFailException(Class<?> clazz) {
        super("ENTITY_ALREADY_ADDED_FAIL");
        this.clazz = clazz;
    }

    @Override
    public Object[] args() {
        return new Object[] { clazz.getSimpleName() };
    }
}
