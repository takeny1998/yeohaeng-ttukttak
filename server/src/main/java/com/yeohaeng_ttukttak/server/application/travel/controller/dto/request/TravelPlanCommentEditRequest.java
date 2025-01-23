package com.yeohaeng_ttukttak.server.application.travel.controller.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;

@Schema(description = "여행 일정의 댓글을 수정하기 위한 요청 DTO 객체입니다.")
public record TravelPlanCommentEditRequest(

        @Schema(title = "본문", minLength = 1, example = "여기에 댓글 내용을 입력하세요.")
        @NotEmpty String content

) { }
