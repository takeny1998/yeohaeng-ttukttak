package com.yeohaeng_ttukttak.server.application.recommendations.controller.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;

public record RecommendPlacesRequest(
        Long cityId,
        AgeGroup ageGroup,
        CompanionType companion,
        Motivation motivation
) { }
