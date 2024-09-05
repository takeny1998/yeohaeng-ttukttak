package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerErrorResponse {

    private final String status = "error";
    private final String message;
    private final Integer code;

    public ServerErrorResponse(String message, Integer code) {
        this.message = message;
        this.code = code;
    }
}
