package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

public class AccessDeniedException extends FailException {

    public <T> AccessDeniedException(Class<T> clazz) {
        super(String.format("%s_ACCESS_DENIED",
                clazz.getSimpleName().toUpperCase()));
    }
}
