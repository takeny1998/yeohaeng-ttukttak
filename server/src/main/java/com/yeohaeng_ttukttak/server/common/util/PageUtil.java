package com.yeohaeng_ttukttak.server.common.util;

import com.querydsl.jpa.impl.JPAQuery;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;

import java.util.List;

public final class PageUtil {

    public static <T> PageResult<T> pageBy(JPAQuery<T> query, PageCommand comm) {
        final List<T> fetched = query
                .offset((long) comm.pageNumber() * comm.pageSize())
                .limit(comm.pageSize() + 1)
                .fetch();

        return new PageResult<>(comm.pageSize(), fetched);
    }



}
