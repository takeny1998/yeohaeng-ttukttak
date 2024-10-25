package com.yeohaeng_ttukttak.server.common.util.dto;

import java.util.List;

public final class PageResult<T> {

    private final List<T> data;
    private final boolean hasNextPage;

    public PageResult(int pageSize, List<T> queriedData) {
        hasNextPage = queriedData.size() > pageSize;

        data = queriedData.stream().limit(pageSize).toList();
    }

    public List<T> data() {
        return data;
    }

    public boolean hasNextPage() {
        return hasNextPage;
    }

}