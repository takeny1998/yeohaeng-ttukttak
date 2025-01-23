package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;


import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;

@Schema(description = "새로운 여행 일정을 생성하기 위한 요청 DTO 객체입니다.")
public record TravelPlanCreateRequest(

        @Schema(description = "방문할 장소의 식별자", example = "1604")
        @NotNull
        Long placeId,

        @Schema(title = "방문 일차",
                description = "4박 5일 여행이라면, 0부터 4까지 지정 가능합니다.",
                minimum = "0", example = "2")
        @NotNull @PositiveOrZero
        Integer dayOfTravel

) { }
