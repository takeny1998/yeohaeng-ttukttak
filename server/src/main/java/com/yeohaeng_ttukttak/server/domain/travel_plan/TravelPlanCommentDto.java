package com.yeohaeng_ttukttak.server.domain.travel_plan;

import java.time.LocalDateTime;

public record TravelPlanCommentDto(
        Long id,
        String content,
        Long planId,
        LocalDateTime createdAt,
        LocalDateTime lastModifiedAt,
        String createdBy
) {

    public static TravelPlanCommentDto of(TravelPlanComment comment) {
        return new TravelPlanCommentDto(
                comment.id(),
                comment.content(),
                comment.plan().id(),
                comment.createdAt(),
                comment.lastModifiedAt(),
                comment.createdBy().uuid()
        );
    }

}
