package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import lombok.Getter;

@Getter
public class EntityNotFoundException extends FailException {

    protected EntityNotFoundException(String code, Throwable cause) {
        super(code, cause);
    }

    public EntityNotFoundException(Throwable cause) {
        this("ENTITY_NOT_FOUND", cause);
    }

    public EntityNotFoundException() {
        this(null);
    }
}
