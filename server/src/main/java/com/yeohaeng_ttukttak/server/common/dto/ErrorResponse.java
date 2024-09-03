package com.yeohaeng_ttukttak.server.common.dto;

public record ErrorResponse(
        String code,
        String message,
        String target
) {
    public ErrorResponse(String code, String message) {
        this(code, message, null);
    }
}
