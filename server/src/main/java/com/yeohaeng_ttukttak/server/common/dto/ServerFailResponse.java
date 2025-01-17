package com.yeohaeng_ttukttak.server.common.dto;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.util.List;
import java.util.Locale;
import java.util.Map;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerFailResponse {

    @Schema(defaultValue = "fail")
    private final ServerResponseStatus status = ServerResponseStatus.fail;

    private final ServerFailResponseData data;

    public ServerFailResponse(List<Map<String, String>> errors) {
        this.data = new ServerFailResponseData(errors);
    }

    public ServerFailResponse(Locale locale, FailException failException) {
        this(List.of(failException.toErrorObject(locale)));
    }

    record ServerFailResponseData(List<Map<String, String>> errors) { }

}