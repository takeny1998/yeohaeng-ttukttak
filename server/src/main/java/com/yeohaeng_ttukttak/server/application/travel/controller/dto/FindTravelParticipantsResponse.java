package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelParticipantDto;

import java.util.List;

public record FindTravelParticipantsResponse(List<TravelParticipantDto> participants) { }
