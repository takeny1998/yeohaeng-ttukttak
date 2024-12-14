package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.util.List;
import java.util.Map;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerFailResponse {

    private final String status = "fail";

    private final List<Map<String, String>> data;

    public ServerFailResponse(List<Map<String, String>> data) {
        this.data = data;
    }

}