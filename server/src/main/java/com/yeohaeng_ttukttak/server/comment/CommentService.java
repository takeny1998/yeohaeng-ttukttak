package com.yeohaeng_ttukttak.server.comment;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;
import com.yeohaeng_ttukttak.server.domain.comment.CommentRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanComment;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentRepository commentRepository;

    @Transactional
    public void createComment(String content) {
        commentRepository.saveAndFlush(new Comment(content));
    }

    @Transactional
    public void editContent(String editorId, Long commentId, String content) {

        final Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        comment.editContent(editorId, content);

    }

    @Transactional(readOnly = true)
    public CommentDto find(Long commentId) {

        final Comment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        return CommentDto.of(comment);
    }

    @Transactional
    public void delete(String deleterId, Long commentId) {

        final Comment comment = commentRepository
                .findById(commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        comment.verifyWriter(deleterId);

        commentRepository.delete(comment);

    }
}
