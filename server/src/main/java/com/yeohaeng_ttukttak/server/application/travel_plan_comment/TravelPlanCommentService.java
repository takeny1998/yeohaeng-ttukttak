package com.yeohaeng_ttukttak.server.application.travel_plan_comment;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import com.yeohaeng_ttukttak.server.domain.comment.CommentRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanComment;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanCommentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelPlanCommentService {

    private final TravelPlanRepository travelPlanRepository;
    private final TravelPlanCommentRepository travelPlanCommentRepository;

    private final CommentRepository commentRepository;

    @Transactional
    public void writeComment(Long travelId, Long planId, String content) {
        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        final Comment comment = new Comment(content);
        commentRepository.save(comment);

        travelPlanCommentRepository.save(
                new TravelPlanComment(travelPlan, comment));
    }

    @Transactional(readOnly = true)
    public List<CommentDto> getOrderedComments(Long planId) {
        return travelPlanCommentRepository
                .getOrderedCommentsByPlanId(planId)
                .stream()
                .map(CommentDto::of)
                .toList();
    }

    @Transactional
    public void editComment(
            String editorId, Long travelId, Long planId, Long commentId, String content) {

        final TravelPlanComment travelPlanComment = travelPlanCommentRepository
                .findByTravelIdAndPlanIdAndCommentId(travelId, planId, commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        travelPlanComment.comment().editContent(editorId, content);
    }

    @Transactional
    public void deleteComment(String deleterId, Long planId, Long commentId) {

        TravelPlanComment planComment = travelPlanCommentRepository.findByPlanIdAndCommentId(planId, commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        planComment.comment().verifyWriter(deleterId);

        travelPlanCommentRepository.delete(planComment);
        commentRepository.delete(planComment.comment());
    }
}
