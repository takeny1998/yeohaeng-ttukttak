package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelMotivationType;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;
import java.util.List;

public record CreateTravelCommand(
        String memberId,
        LocalDate startedOn,
        LocalDate endedOn,
        List<TravelCompanionType> companionTypes,
        List<TravelMotivationType> motivationTypes,
        List<EntityReference<Long>> cities
) { }