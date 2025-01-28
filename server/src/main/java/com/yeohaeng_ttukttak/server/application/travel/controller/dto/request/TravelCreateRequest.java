package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;

import java.time.LocalDate;
import java.util.List;

@Schema(title = "여행 생성 요청 DTO")
public record TravelCreateRequest(
        @Schema(title = "이름", nullable = true)
        String name,

        @Schema(title = "시작 날짜", example = "2024-12-29")
        @NotNull LocalDate startedOn,

        @Schema(title = "종료 날짜", example = "2024-12-31")
        @NotNull LocalDate endedOn,

        @Schema(title = "동반자 타입 목록", example = "[ \"children\", \"spouse\" ]")
        @NotNull List<CompanionType> companionTypes,

        @Schema(title = "여행 동기 목록", example = "[ \"rest\", \"friendship\" ]")
        @NotNull List<MotivationType> motivationTypes,

        @Schema(title = "방문할 도시의 식별자 목록", example = "[ \"162\" ]")
        @NotNull List<Long> cityIds
) { }
