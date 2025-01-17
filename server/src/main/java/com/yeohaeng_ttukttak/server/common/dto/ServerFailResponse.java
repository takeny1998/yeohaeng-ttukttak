package com.yeohaeng_ttukttak.server.common.dto;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Configurable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Getter
@ToString
@EqualsAndHashCode
public final class ServerFailResponse {

    @Schema(defaultValue = "fail")
    private final ServerResponseStatus status = ServerResponseStatus.fail;

    private final ServerFailResponseData data;

    public ServerFailResponse(List<Map<String, String>> errors) {
        this.data = new ServerFailResponseData(errors);
    }

    public ServerFailResponse(Map<String, String> error) {
        this(List.of(error));
    }

    record ServerFailResponseData(List<Map<String, String>> errors) { }

}