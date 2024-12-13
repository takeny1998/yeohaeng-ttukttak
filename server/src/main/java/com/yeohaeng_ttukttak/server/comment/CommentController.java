package com.yeohaeng_ttukttak.server.comment;

import com.yeohaeng_ttukttak.server.comment.dto.CommentResponse;
import com.yeohaeng_ttukttak.server.comment.dto.EditCommentRequest;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2/comments")
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;

    @PostMapping
    @Authorization
    public void createComment(
            AuthenticationContext authentication
    ) {
        commentService.createComment("하이");
    }

    @PatchMapping("/{commentId}")
    @Authorization
    public ServerResponse<CommentResponse> editComment(
            @PathVariable Long commentId,
            @RequestBody @Valid EditCommentRequest request,
            AuthenticationContext authentication) {

        commentService.editContent(
                authentication.uuid(), commentId, request.content());

        final CommentDto commentDto = commentService.find(commentId);

        return new ServerResponse<>(new CommentResponse(commentDto));
    }


}
