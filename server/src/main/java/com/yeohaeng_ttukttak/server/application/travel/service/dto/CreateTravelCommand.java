package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.place.entity.City;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MotivationType;

import java.time.LocalDate;
import java.util.List;

public record CreateTravelCommand(
        String memberId,
        String name,
        LocalDate startedOn,
        LocalDate endedOn,
        CompanionType companionType,
        List<MotivationType> motivationTypes,
        List<EntityReference<Long>> cities
) { }