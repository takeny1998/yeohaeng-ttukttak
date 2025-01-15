package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import jakarta.validation.constraints.*;

import java.time.LocalDate;
import java.util.List;

/**
 * 사용자 여행 생성을 위한 요청 객체입니다.
 *
 * @param name 여행 이름으로 사용할 문자열.
 * @param startedOn 여행의 시작 날짜.
 * @param endedOn 여행의 종료 날짜.
 * @param companionTypes 동반자 타입 목록
 * @param motivationTypes 여행 동기 목록
 * @param cityIds 방문할 도시의 식별자 목록
 */
public record TravelRequest(
        String name,
        @NotNull LocalDate startedOn,
        @NotNull LocalDate endedOn,
        @NotNull List<CompanionType> companionTypes,
        @NotNull List<MotivationType> motivationTypes,
        @NotNull List<Long> cityIds
) { }
