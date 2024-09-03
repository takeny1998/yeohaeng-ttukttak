package com.yeohaeng_ttukttak.server.common.dto;

public record Response<T>(
        String code,
        T data
) {

    public Response(T data) {
        this("success", data);
    }

}
