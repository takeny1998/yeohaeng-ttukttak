package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;

import java.time.LocalDate;
import java.util.List;

public record CreateTravelCommand(
        String memberId,
        LocalDate startedOn,
        LocalDate endedOn,
        List<CompanionType> companionTypes,
        List<MotivationType> motivationTypes,
        List<EntityReference<Long>> cities
) { }