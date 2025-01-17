package com.yeohaeng_ttukttak.server.common.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
@EqualsAndHashCode
public class ServerResponse<T> {

    @Schema(defaultValue = "success")
    final ServerResponseStatus status = ServerResponseStatus.success;

    final T data;

    public ServerResponse(T data) {
        this.data = data;
    }

    public ServerResponse() {
        this(null);
    }
}