package com.yeohaeng_ttukttak.server.common.dto;

public record InfiniteScrollMetadata(
            int pageNumber, int pageSize, boolean hasNext) { }