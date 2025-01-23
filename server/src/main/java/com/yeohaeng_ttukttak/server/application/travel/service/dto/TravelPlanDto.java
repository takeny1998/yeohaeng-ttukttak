package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlan;
import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDate;

@Schema(title = "여행 일정")
public record TravelPlanDto(
        @Schema(title = "식별자", example = "154")
        Long id,

        @Schema(title = "방문 날짜", example = "2024-12-29")
        LocalDate willVisitOn,

        @Schema(title = "방문 순서", example = "0")
        Integer orderOfPlan,

        @Schema(title = "장소의 식별자", example = "20461")
        String placeId) {

    public static TravelPlanDto of(TravelPlan plan) {

        final LocalDate willVisitOn = plan
                .getTravel()
                .startedOn()
                .plusDays(plan.getDayOfTravel());

        return new TravelPlanDto(
                plan.getId(),
                willVisitOn,
                plan.getOrderOfPlan(),
                plan.getPlace().id().toString()
        );
    }

}
