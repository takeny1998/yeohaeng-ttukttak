package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.BaseTimeMemberMetadata;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlanComment;
import io.swagger.v3.oas.annotations.media.Schema;

public record TravelPlanCommentDto(

        @Schema(title = "식별자", example = "453")
        Long id,

        @Schema(title = "본문", example = "여기에 댓글 내용을 입력하세요.")
        String content,

        @Schema(implementation = BaseTimeMemberMetadata.class)
        BaseTimeMemberMetadata metadata

) {

    public static TravelPlanCommentDto of(TravelPlanComment comment) {
        return new TravelPlanCommentDto(
                comment.getId(),
                comment.getContent(),
                BaseTimeMemberMetadata.of(comment)
        );
    }

}
