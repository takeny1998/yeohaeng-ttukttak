package com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto;

import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;

import java.util.List;

public record CommentListResponse(List<CommentDto> comments) { }
