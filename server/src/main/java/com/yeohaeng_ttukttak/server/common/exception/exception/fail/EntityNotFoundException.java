package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.exception.interfaces.EntityTargetException;

import static java.lang.String.format;
import static org.springframework.util.StringUtils.uncapitalize;

public class EntityNotFoundException extends FailException implements EntityTargetException {

    static final String code = "ENTITY_NOT_FOUND_FAIL";

    private final Class<?> target;

    public EntityNotFoundException(Class<?> target) {
        super(code, format("%sId", uncapitalize(target.getSimpleName())));
        this.target = target;
    }

    @Override
    public Class<?> target() {
        return target;
    }

}
