package com.yeohaeng_ttukttak.server.application.plan;

import com.yeohaeng_ttukttak.server.application.plan.dto.CommentListResponse;
import com.yeohaeng_ttukttak.server.application.plan.dto.EditCommentRequest;
import com.yeohaeng_ttukttak.server.application.plan.dto.WriteCommentRequest;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/plans/{planId}/comments")
@RequiredArgsConstructor
public class TravelPlanCommentController {

    private final TravelPlanCommentService travelPlanCommentService;

    @PostMapping
    @Authorization
    public ServerResponse<CommentListResponse> writeComment(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @RequestBody @Valid WriteCommentRequest request,
            AuthenticationContext authentication) {

        final String writerId = authentication.uuid();

        travelPlanCommentService.writeComment(
                writerId, travelId, planId, request.content());

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerResponse<>(
                new CommentListResponse(dtoList));
    }

    @GetMapping
    public ServerResponse<CommentListResponse> getOrderedComments(
            @PathVariable Long travelId,
            @PathVariable Long planId) {

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerResponse<>(
                new CommentListResponse(dtoList));
    }

    @PatchMapping("/{commentId}")
    @Authorization
    public ServerResponse<CommentListResponse> editComment(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @PathVariable Long commentId,
            @RequestBody @Valid EditCommentRequest request,
            AuthenticationContext authentication) {

        final String editorId = authentication.uuid();
        final String content = request.content();

        travelPlanCommentService.editComment(
                editorId, travelId, planId, commentId, content);

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerResponse<>(
                new CommentListResponse(dtoList));
    }

    @DeleteMapping("/{commentId}")
    @Authorization
    public ServerResponse<CommentListResponse> deleteComment(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @PathVariable Long commentId,
            AuthenticationContext authentication) {

        travelPlanCommentService.deleteComment(authentication.uuid(), planId, commentId);

        final List<CommentDto> dtoList =
                travelPlanCommentService.getOrderedComments(planId);

        return new ServerResponse<>(
                new CommentListResponse(dtoList));
    }

}
