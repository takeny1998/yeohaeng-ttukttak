package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;

public record UpdateTravelVisitRequest(
        Integer orderOfVisit,
        Integer dayOfTravel
) {


    public UpdateTravelVisitCommand toCommand(Long id) {
        return new UpdateTravelVisitCommand(id, orderOfVisit, dayOfTravel);
    }


}
