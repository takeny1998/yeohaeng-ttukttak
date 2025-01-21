package com.yeohaeng_ttukttak.server.common.exception.dto;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentFailException;
import jakarta.annotation.Nullable;

public class FailExceptionWrapper extends ExceptionWrapper {

    public FailExceptionWrapper(String code, FailException instance) {
        super(code, instance);
    }

    @Nullable
    public String getField() {
        return super.getInstance() instanceof ArgumentFailException
                ? ((ArgumentFailException) getInstance()).getField()
                : null;
    }

}
