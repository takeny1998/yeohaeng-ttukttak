package com.yeohaeng_ttukttak.server.common.dto;


import com.querydsl.jpa.impl.JPAQuery;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;

import java.util.List;
import java.util.function.Function;

public final class JpaInfiniteScrollResult<T, R> implements InfiniteScrollResult<R> {

    private final List<R> records;

    private final InfiniteScrollMetadata metadata;

    public JpaInfiniteScrollResult(InfiniteScrollCommand command, JPAQuery<T> jpaQuery, Function<T, R> mapEntityToDto) {

        final List<T> entities = jpaQuery
                .offset((long) command.pageNumber() * command.pageSize())
                .limit(command.pageSize() + 1)
                .fetch();

        if (entities.isEmpty()) {
            throw ExceptionCode.ENTITY_NOT_FOUND_FAIL.wrap();
        }

        final boolean hasNext = entities.size() > command.pageSize();

        this.records = entities.stream()
                .limit(command.pageSize())
                .map(mapEntityToDto)
                .toList();

        this.metadata = new InfiniteScrollMetadata(command.pageNumber(), command.pageSize(), hasNext);
    }

    @Override
    public List<R> records() {
        return records;
    }

    @Override
    public InfiniteScrollMetadata metadata() {
        return metadata;
    }

}
