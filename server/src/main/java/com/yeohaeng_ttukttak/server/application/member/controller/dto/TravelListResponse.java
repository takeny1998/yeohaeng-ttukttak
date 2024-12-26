package com.yeohaeng_ttukttak.server.application.member.controller.dto;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;

import java.util.List;

public record TravelListResponse(
        List<TravelDto> travels
) { }
