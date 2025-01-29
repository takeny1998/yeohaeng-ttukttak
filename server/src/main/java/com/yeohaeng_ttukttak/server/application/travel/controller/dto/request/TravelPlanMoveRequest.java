package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;

import java.time.LocalDate;

@Schema(description = "여행 일정의 순서를 이동하기 위한 요청 DTO 객체입니다.")
public record TravelPlanMoveRequest(

        @Schema(title = "방문 순서", minimum = "0", example = "1")
        @PositiveOrZero @NotNull
        Integer orderOfPlan,

        @Schema(title = "방문 일자", example = "2024-12-28")
        @NotNull
        LocalDate willVisitOn

) {}
