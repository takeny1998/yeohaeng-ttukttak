package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;

import java.time.LocalDate;

public record UpdateTravelVisitRequest(
        Integer orderOfVisit,
        LocalDate visitedOn
) {


    public UpdateTravelVisitCommand toCommand(Long visitId, Long travelId, String memberId) {
        return new UpdateTravelVisitCommand(visitId, travelId, memberId, orderOfVisit, visitedOn);
    }


}
