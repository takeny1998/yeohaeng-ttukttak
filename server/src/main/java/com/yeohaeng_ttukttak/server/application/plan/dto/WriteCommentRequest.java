package com.yeohaeng_ttukttak.server.application.plan.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public record WriteCommentRequest(
        @NotEmpty String content
) { }
