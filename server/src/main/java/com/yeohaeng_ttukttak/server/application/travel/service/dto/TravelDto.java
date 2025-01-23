package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.BaseTimeMemberMetadata;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.*;
import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;


@Schema(description = "여행 도메인을 표현하는 DTO 객체입니다.")
public record TravelDto(
        @Schema(title = "식별자")
        Long id,

        @Schema(title = "이름", example = "증평, 청주 연말 여행")
        String name,

        @Schema(title = "시작 날짜", example = "2024-12-29")
        LocalDate startedOn,

        @Schema(title = "종료 날짜", example = "2024-12-31")
        LocalDate endedOn,

        @Schema(title = "동반자 타입 목록", example = "[ \"children\", \"spouse\" ]")
        List<CompanionType> companionTypes,

        @Schema(title = "여행 동기 목록", example = "[ \"rest\", \"friendship\" ]")
        List<MotivationType> motivationTypes,

        @Schema(title = "방문할 도시의 식별자 목록", example = "[ \"162\" ]")
        List<Long> cityIds,

        @Schema(implementation = BaseTimeMemberMetadata.class)
        BaseTimeMemberMetadata metadata
) {

    public static TravelDto of(final Travel travel) {

        return new TravelDto(
                travel.id(),
                travel.name(),
                travel.startedOn(),
                travel.endedOn(),
                travel.companions().stream()
                        .map(TravelCompanion::type)
                        .toList(),
                travel.motivations().stream()
                        .map(TravelMotivation::type)
                        .toList(),
                travel.cities().stream()
                        .map(TravelCity::city)
                        .map(City::id)
                        .toList(),
                BaseTimeMemberMetadata.of(travel)
        );
    }

}
