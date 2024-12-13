package com.yeohaeng_ttukttak.server.application.plan.dto;

import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;

import java.util.List;

public record CommentListResponse(List<CommentDto> comments) { }
