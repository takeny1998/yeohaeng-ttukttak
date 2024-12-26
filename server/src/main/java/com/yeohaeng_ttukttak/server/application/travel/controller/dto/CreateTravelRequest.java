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
        @NotEmpty @Size(max = 3) List<CompanionType> companionTypes,
        @NotEmpty @Size(max = 5) List<MotivationType> motivationTypes
) { }
