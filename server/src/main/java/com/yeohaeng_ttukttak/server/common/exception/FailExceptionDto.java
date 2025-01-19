package com.yeohaeng_ttukttak.server.common.exception;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentFailException;
import io.swagger.v3.oas.annotations.media.Schema;


@JsonPropertyOrder({"code", "field", "message"})
public record FailExceptionDto(
        @Schema(description = "오류 코드. 특정 오류를 식별하는 데 사용됩니다.",
                example = "FAIL_EXCEPTION")
        String code,
        @Schema(description = "오류 메시지. 요청 데이터가 사전 조건 또는 사후 조건을 충족하지 않을 때 발생하는 설명입니다.",
                example = "요청 데이터가 사전 조건 또는 사후 조건을 충족하지 않습니다. 요청 데이터를 다시 검토하고 다시 시도해 주세요.")
        String message,
        @Schema(description = "문제가 발생한 필드의 이름. 특정 필드에서 오류가 발생한 경우 사용됩니다. 오류가 필드와 관련이 없으면 null일 수 있습니다.",
                example = "willVisitOn", nullable = true)
        String field) {

    public static FailExceptionDto of (FailException failException) {

        final String field = failException instanceof ArgumentFailException
                ? ((ArgumentFailException) failException).getField()
                : null;

        return new FailExceptionDto(
                failException.getCode(), failException.getMessage(), field);
    }
}