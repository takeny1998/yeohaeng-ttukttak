package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;
import java.util.List;

@Schema(title = "여행 수정 요청 DTO")
public record TravelUpdateRequest(
        @Schema(title = "이름", nullable = true)
        String name,

        @Schema(title = "시작 날짜", example = "2024-12-29", nullable = true)
        LocalDate startedOn,

        @Schema(title = "종료 날짜", example = "2024-12-31", nullable = true)
        LocalDate endedOn,

        @Schema(title = "동반자 타입 목록", example = "[ \"children\", \"spouse\" ]", nullable = true)
        List<CompanionType> companionTypes,

        @Schema(title = "여행 동기 목록", example = "[ \"rest\", \"friendship\" ]", nullable = true)
        List<MotivationType> motivationTypes,

        @Schema(title = "방문할 도시의 식별자 목록", example = "[ \"162\" ]", nullable = true)
        List<Long> cityIds
) { }
