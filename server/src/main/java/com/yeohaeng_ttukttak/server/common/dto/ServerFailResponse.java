package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.Map;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerFailResponse {

    private final String status = "fail";

    private final ServerFailResponseData data;

    public ServerFailResponse(List<Map<String, String>> errors) {
        this.data = new ServerFailResponseData(errors);
    }

    record ServerFailResponseData(List<Map<String, String>> errors) { }

}