package com.yeohaeng_ttukttak.server.comment.dto;

import jakarta.validation.constraints.NotEmpty;

public record EditCommentRequest(
        @NotEmpty String content
) { }
