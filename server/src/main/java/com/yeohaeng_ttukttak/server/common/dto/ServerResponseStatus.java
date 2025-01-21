package com.yeohaeng_ttukttak.server.common.dto;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "작업 결과 상태를 표현하는 객체입니다.")
public enum ServerResponseStatus {

    success, fail, error

}
