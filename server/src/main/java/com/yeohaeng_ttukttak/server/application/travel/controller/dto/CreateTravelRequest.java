package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import jakarta.validation.constraints.*;

import java.time.LocalDate;
import java.util.List;

public record CreateTravelRequest (
        String name,
        LocalDate startedOn,
        LocalDate endedOn,
        List<CompanionType> companionTypes,
        List<MotivationType> motivationTypes
) { }
