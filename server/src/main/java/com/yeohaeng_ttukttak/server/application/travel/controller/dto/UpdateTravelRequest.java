package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;

import java.time.LocalDate;
import java.util.List;

/**
 * 여행의 기본 정보 수정을 위한 요청 객체입니다.
 *
 * @param name {@link Travel#rename(String name)}
 * @param startedOn {@link Travel#updateDates(LocalDate, LocalDate)}
 * @param endedOn {@link Travel#updateDates(LocalDate, LocalDate)}
 * @param motivationTypes {@link Travel#updateMotivationsTypes(List)}
 * @param companionTypes {@link Travel#updateCompanionTypes(List)}
 */
public record UpdateTravelRequest(
        String name,
        LocalDate startedOn,
        LocalDate endedOn,
        List<MotivationType> motivationTypes,
        List<CompanionType> companionTypes
) { }
