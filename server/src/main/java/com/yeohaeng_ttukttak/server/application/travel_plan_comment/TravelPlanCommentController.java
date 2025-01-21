package com.yeohaeng_ttukttak.server.application.travel_plan_comment;

import com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto.CommentListResponse;
import com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto.CommentContentRequest;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@JsonRequestMapping("/api/v2/travels/{travelId}/plans/{planId}/comments")
@RequiredArgsConstructor
@Tag(name = "댓글 (Comment)", description = "댓글과 관련된 동작을 수행하는 컬렉션 입니다.")
public class TravelPlanCommentController {

    private final TravelPlanCommentService travelPlanCommentService;

    /**
     * 지정한 여행 계획에 새로운 댓글을 작성합니다.
     *
     * <ul>
     *     <li>여행 생성자 및 참여자만 댓글을 작성할 수 있습니다.</li>
     * </ul>
     *
     * @param travelId 사용자 여행의 식별자
     * @param planId 여행 일정의 식별자
     * @param request 작성할 댓글 정보
     * @return 새로운 상태의 댓글 목록
     */
    @PostMapping
    @Authentication
    public ServerSuccessResponse<CommentListResponse> writeComment(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @RequestBody @Valid CommentContentRequest request) {

        travelPlanCommentService.writeComment(
                 travelId, planId, request.content());

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerSuccessResponse<>(
                new CommentListResponse(dtoList));
    }

    /**
     * 지정한 여행 계획의 댓글 목록을 조회합니다.
     *
     * @param travelId 사용자 여행의 식별자
     * @param planId 여행 일정의 식별자
     * @return 조회된 댓글 목록
     */
    @GetMapping
    public ServerSuccessResponse<CommentListResponse> getOrderedComments(
            @PathVariable Long travelId,
            @PathVariable Long planId) {

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerSuccessResponse<>(
                new CommentListResponse(dtoList));
    }

    /**
     * 지정한 여행 게획의 댓글 본문을 수정합니다.
     *
     * <ul>
     *     <li>댓글의 작성자만 본문을 수정할 수 있습니다.</li>
     * </ul>
     *
     * @param travelId 사용자 여행의 식별자
     * @param planId 여행 일정의 식별자
     * @param commentId 댓글의 식별자
     * @param request 수정할 댓글의 본문 정보
     * @return 새로운 상태의 댓글 목록
     */
    @PatchMapping("/{commentId}")
    @Authentication
    public ServerSuccessResponse<CommentListResponse> editComment(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @PathVariable Long commentId,
            @RequestBody @Valid CommentContentRequest request,
            AuthenticationContext authentication) {

        final String editorId = authentication.uuid();
        final String content = request.content();

        travelPlanCommentService.editComment(
                editorId, travelId, planId, commentId, content);

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerSuccessResponse<>(
                new CommentListResponse(dtoList));
    }

    /**
     * 지정한 여행 게획의 댓글을 삭제합니다.
     *
     * <ul>
     *     <li>댓글의 작성자만 삭제할 수 있습니다.</li>
     * </ul>
     *
     * @param travelId 사용자 여행의 식별자
     * @param planId 여행 일정의 식별자
     * @param commentId 댓글의 식별자
     * @return 새로운 상태의 댓글 목록
     */
    @DeleteMapping("/{commentId}")
    @Authentication
    public ServerSuccessResponse<CommentListResponse> deleteComment(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @PathVariable Long commentId,
            AuthenticationContext authentication) {

        travelPlanCommentService.deleteComment(authentication.uuid(), planId, commentId);

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerSuccessResponse<>(
                new CommentListResponse(dtoList));
    }

}
