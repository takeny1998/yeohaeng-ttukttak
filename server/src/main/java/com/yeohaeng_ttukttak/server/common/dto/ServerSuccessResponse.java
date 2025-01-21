package com.yeohaeng_ttukttak.server.common.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class ServerSuccessResponse<T> extends ServerResponse {

    @Schema(defaultValue = "success")
    final ServerResponseStatus status = ServerResponseStatus.success;

    final T data;

    public ServerSuccessResponse(T data) {
        this.data = data;
    }

    public ServerSuccessResponse() {
        this(null);
    }
}