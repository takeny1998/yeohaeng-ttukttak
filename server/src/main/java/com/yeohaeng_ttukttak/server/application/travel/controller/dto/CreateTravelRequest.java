package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.dto.DateRange;
import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.common.validation.annotation.ValidateFutureDateRange;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;
import jakarta.validation.constraints.*;

import java.util.List;

public record CreateTravelRequest (
        @ValidateFutureDateRange DateRange date,
        @NotNull CompanionType companionType,
        @NotEmpty @Size(max = 3) List<Motivation> motivations,
        @NotEmpty List<EntityReference<Long>> cities
) {

    public CreateTravelCommand toCommand(String memberId) {
        return new CreateTravelCommand(
                memberId,
                date().startedOn(),
                date().endedOn(),
                companionType(),
                motivations(),
                cities()
        );
    }

}
