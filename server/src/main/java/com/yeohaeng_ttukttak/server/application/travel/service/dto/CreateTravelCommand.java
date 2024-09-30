package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Companion;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;

import java.time.LocalDate;
import java.util.List;

public record CreateTravelCommand(
        String memberId,
        LocalDate startedOn,
        LocalDate endedOn,
        Companion companion,
        List<Motivation> motivations,
        List<EntityReference<Long>> cities
) { }