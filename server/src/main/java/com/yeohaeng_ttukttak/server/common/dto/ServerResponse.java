package com.yeohaeng_ttukttak.server.common.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

/**
 * 사용자 요청의 처리 결과를 나타내는 응답 객체입니다.
 *
 * @param <T> 결과 데이터를 표현하는 타입 파라미터
 */
@ToString
@Getter
@EqualsAndHashCode
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
