package com.yeohaeng_ttukttak.server.application.plan.dto;

import jakarta.validation.constraints.NotEmpty;

public record EditCommentRequest(
        @NotEmpty String content
) { }
