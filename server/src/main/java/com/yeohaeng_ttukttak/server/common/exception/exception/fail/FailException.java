package com.yeohaeng_ttukttak.server.common.exception.exception.fail;

import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.locale.LocalizedMessageService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;

@Configurable(autowire = Autowire.BY_TYPE, preConstruction = true)
public abstract class FailException extends BaseException {

    @Autowired
    private LocalizedMessageService messageService;

    private final String field;

    protected FailException(String code, String field, Throwable cause) {
        super(code, cause);
        this.field = field;
    }

    protected FailException(String code, String field) {
        this(code, field, null);
    }

    protected FailException(String code) {
        this(code, null);
    }

    public String field() {
        return field;
    }

    public Map<String, String> toErrorObject(Locale locale) {

        final Map<String, String> error = new HashMap<>(
                Map.of("code", code(),
                        "message", messageService.fromException(locale, this)));

        if (Objects.nonNull(field)) {
            error.put("field", field);
        }

        return error;

    }

}
