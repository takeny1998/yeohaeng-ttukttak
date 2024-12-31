package com.yeohaeng_ttukttak.server.common.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record InfiniteScrollCommand(
        @NotNull @Min(1) int pageSize, @Min(0) int pageNumber) { }