package com.yeohaeng_ttukttak.server.common.dto;

import com.yeohaeng_ttukttak.server.common.exception.dto.FailExceptionDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Schema
@Getter
@ToString
public final class ServerFailResponse extends ServerResponse {

    @Schema(defaultValue = "fail")
    private final ServerResponseStatus status = ServerResponseStatus.fail;

    private final List<FailExceptionDto> data;

    public ServerFailResponse(List<FailExceptionDto> failExceptions) {
        this.data = failExceptions;
    }

    public ServerFailResponse(FailExceptionDto failException) {
        this(List.of(failException));
    }


}