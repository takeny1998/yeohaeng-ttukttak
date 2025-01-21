package com.yeohaeng_ttukttak.server.common.exception.dto;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentFailException;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.annotation.Nullable;


@Schema
@JsonPropertyOrder({"code", "field", "message"})
public record FailExceptionDto(
    @Schema(description = "특정 예외를 식별하는 예외 코드입니다.",
            example = "FAIL_EXCEPTION")
    String code,
    @Schema(description = "예외 상황을 설명하는 예외 메세지 입니다. 요청 언어에 따라 한국어 혹은 영어 메세지를 반환합니다.",
            examples = { "The start date must be the same as or earlier than the end date.", "시작 날짜는 종료 날짜와 같거나 그보다 이전이어야 합니다." })
    String message,
    @Schema(description = "특정 예외가 요청 데이터와 연관이 있을 경우 지정됩니다.",
            example = "willVisitOn", nullable = true)
    @Nullable String field) {


    public static FailExceptionDto of (FailExceptionWrapper exceptionWrapper) {

        return new FailExceptionDto(
                exceptionWrapper.getCode(),
                exceptionWrapper.getMessage(),
                exceptionWrapper.getField());
    }


}