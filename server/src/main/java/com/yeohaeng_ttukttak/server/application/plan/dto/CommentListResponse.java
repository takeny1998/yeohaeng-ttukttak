package com.yeohaeng_ttukttak.server.application.plan.dto;

import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanCommentDto;

import java.util.List;

public record CommentListResponse(List<TravelPlanCommentDto> comments) { }
