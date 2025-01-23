package com.yeohaeng_ttukttak.server.doc.travel;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentEditRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentWriteRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto.TravelPlanCommentListResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "여행 일정 댓글", description = "여행 일정의 댓글에 동작을 처리하는 컬렉션 입니다.")
public interface TravelPlanCommentDocument {

    String MUST_ORDER_BY_COMMENT =
    """
    - 댓글 목록은 아래와 같은 기준으로 정렬됩니다.
    
        1. 생성일시(createdAt)가 느린 순
        
        2. 수정일시(lastModifiedAt)가 느린 순
        
        3. 식별자(id) 값이 작은 순
    """;

    @Operation(
            summary = "댓글 작성 API",
            description = "[여행을 생성](#/여행/create)하거나 기존 여행에 참여한 상태여야 합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "생성된 댓글을 포함한 상위 일정의 모든 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    TravelPlanCommentListResponse write(
            Long travelId, Long planId, TravelPlanCommentWriteRequest request);

    @Operation(summary = "댓글 목록 조회 API")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "조회된 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    TravelPlanCommentListResponse findAll(Long travelId, Long planId);

    @Operation(
            summary = "댓글 수정 API",
            description = "지정한 댓글을 작성한 사용자여야 합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "수정 내용이 반영된 지정한 여행 일정의 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    TravelPlanCommentListResponse edit(
            Long travelId, Long planId, Long commentId,
            TravelPlanCommentEditRequest request);

    @Operation(
            summary = "댓글 삭제 API",
            description = "해당 [여행을 생성](#/여행/create)하거나 [댓글을 작성](#여행%20일정%20댓글/write)한 사용자여야 합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "삭제된 댓글을 제외한 여행 일정의 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    TravelPlanCommentListResponse delete(Long travelId, Long planId, Long commentId);

}
