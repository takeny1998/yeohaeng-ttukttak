package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;

import java.time.LocalDate;

@Schema(description = "새로운 여행 일정을 생성하기 위한 요청 DTO 객체입니다.")
public record TravelPlanCreateRequest(

        @Schema(title = "여행 ID", example = "1502")
        @NotNull
        Long travelId,

        @Schema(title = "장소 ID", example = "1604")
        @NotNull
        Long placeId,

        @Schema(title = "방문 일자", example = "2024-12-29")
        @NotNull
        LocalDate willVisitOn
) { }
