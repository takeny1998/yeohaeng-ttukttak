package com.yeohaeng_ttukttak.server.common.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Schema
@Getter
@ToString
public final class ServerErrorResponse extends ServerResponse {

    @Schema(defaultValue = "error")
    private final ServerResponseStatus status = ServerResponseStatus.error;

    private final String code;

    private final String message;

    public ServerErrorResponse(String code, String message) {
        this.message = message;
        this.code = code;
    }
}
