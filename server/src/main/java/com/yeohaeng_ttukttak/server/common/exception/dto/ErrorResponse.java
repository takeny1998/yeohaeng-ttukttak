package com.yeohaeng_ttukttak.server.common.exception.dto;

import com.fasterxml.jackson.annotation.JsonInclude;

import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;

@JsonInclude(NON_NULL)
public record ErrorResponse(
        String code,
        String message,
        String target
) {
    public ErrorResponse(String code, String message) {
        this(code, message, null);
    }
}
