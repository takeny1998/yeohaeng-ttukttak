package com.yeohaeng_ttukttak.server.common.dto;

import java.util.List;

public record EntityReference<T> (
        T id
) {

    public static <T> List<T> extractId(List<EntityReference<T>> references) {
        return references.stream()
                .map(EntityReference::id)
                .toList();
    }

}