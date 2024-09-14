package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@EqualsAndHashCode
@ToString
@Getter
public final class ServerResponse<T> {

    final String status = "success";
    final T data;

    public ServerResponse(T data) {
        this.data = data;
    }

    public ServerResponse() {
        this(null);
    }
}
