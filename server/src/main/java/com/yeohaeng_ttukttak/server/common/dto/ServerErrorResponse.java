package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerErrorResponse {

    private final String status = "error";

    private final String code;

    private final String message;

    public ServerErrorResponse(String code, String message) {
        this.message = message;
        this.code = code;
    }
}
