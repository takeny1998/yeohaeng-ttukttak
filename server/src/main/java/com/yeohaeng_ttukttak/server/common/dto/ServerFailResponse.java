package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.util.Map;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerFailResponse {

    private final String status = "fail";
    private final Map<String, String> data;
    private final String message;

    public ServerFailResponse(String message) {
        this(null, message);
    }

    public ServerFailResponse(Map<String, String> data, String message) {
        this.data = data;
        this.message = message;
    }
}