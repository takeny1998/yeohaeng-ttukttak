package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MotivationType;
import jakarta.validation.constraints.*;

import java.time.LocalDate;
import java.util.List;

public record CreateTravelRequest (
        String name,
        @Future LocalDate startedOn,
        @Future LocalDate endedOn,
        @NotNull CompanionType companionType,
        @NotEmpty @Size(max = 3) List<MotivationType> motivations,
        @NotEmpty List<EntityReference<Long>> cities
) {

    public CreateTravelCommand toCommand(String memberId) {
        return new CreateTravelCommand(
                memberId, name(), startedOn(), endedOn(),
                companionType(), motivations(), cities()
        );
    }

}
