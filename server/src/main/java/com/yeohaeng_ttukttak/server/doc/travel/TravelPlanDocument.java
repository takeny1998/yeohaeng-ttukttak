package com.yeohaeng_ttukttak.server.doc.travel;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentEditRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentWriteRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanCommentListResponse;
import com.yeohaeng_ttukttak.server.doc.Throws;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL;
import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL;


@Tag(name = "여행 일정", description = "여행 일정과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelPlanDocument {

    String REQUIRE_CREATE_OR_JOIN =  "[새 여행 생성](#/여행/create)하거나 기존 여행에 참여한 상태여야 합니다.";


    String MUST_ORDER_BY_COMMENT =
            """
            - 댓글 목록은 아래와 같은 기준으로 정렬됩니다.
            
                1. 생성일시(createdAt)가 느린 순
                
                2. 수정일시(lastModifiedAt)가 느린 순
                
                3. 식별자(id) 값이 작은 순
            """;

    @Operation(
        summary = "일정 생성 API",
        description = REQUIRE_CREATE_OR_JOIN)
    @ApiResponse(
        responseCode = "200",
        useReturnTypeSchema = true,
        description = """
        생성된 일정 객체를 반환합니다.
        
        - 추가된 일정은 일차(willVisitOn)가 같은 일정 목록의 마지막 순서(orderOfPlan)가 부여됩니다.
         
        """)
    @Throws(DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL)
    TravelPlanResponse create(TravelPlanCreateRequest request);


    @Operation(
            summary = "댓글 작성 API",
            description = "[여행을 생성](#/여행/create)하거나 기존 여행에 참여한 상태여야 합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "생성된 댓글을 포함한 상위 일정의 모든 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    @Throws(COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL)
    TravelPlanCommentListResponse writeComment(Long planId, TravelPlanCommentWriteRequest request);


    @Operation(summary = "댓글 목록 조회 API")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "조회된 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    TravelPlanCommentListResponse findAllComments(Long planId);


    @Operation(
            summary = "댓글 수정 API",
            description = "지정한 댓글을 작성한 사용자여야 합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "수정 내용이 반영된 지정한 여행 일정의 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    @Throws(COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL)
    TravelPlanCommentListResponse editComment(
            Long planId, Long commentId, TravelPlanCommentEditRequest request);

    @Operation(
            summary = "댓글 삭제 API",
            description = "해당 [여행을 생성](#/여행/create)하거나 [댓글을 작성](#여행%20일정%20댓글/write)한 사용자여야 합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "삭제된 댓글을 제외한 여행 일정의 댓글 목록을 반환합니다.\n" + MUST_ORDER_BY_COMMENT)
    TravelPlanCommentListResponse deleteComment(Long planId, Long commentId);


}
