package com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto;

import jakarta.validation.constraints.NotEmpty;

public record EditCommentRequest(
        @NotEmpty String content
) { }
