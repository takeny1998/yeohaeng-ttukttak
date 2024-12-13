package com.yeohaeng_ttukttak.server.domain.comment;

import java.time.LocalDateTime;

public record CommentDto(
        Long id,
        String content,
        LocalDateTime createdAt,
        LocalDateTime lastModifiedAt,
        String createdBy
) {

    public static CommentDto of(Comment comment) {
        return new CommentDto(
                comment.id(),
                comment.content(),
                comment.createdAt(),
                comment.lastModifiedAt(),
                comment.createdBy().uuid()
        );
    }

}
