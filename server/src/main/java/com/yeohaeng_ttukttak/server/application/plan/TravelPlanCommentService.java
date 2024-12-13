package com.yeohaeng_ttukttak.server.application.plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import com.yeohaeng_ttukttak.server.domain.comment.CommentRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanComment;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanCommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TravelPlanCommentService {

    private final TravelPlanRepository planRepository;
    private final TravelPlanCommentRepository planCommentRepository;

    private final CommentRepository commentRepository;

    @Transactional
    public void writeComment(String writerId, Long planId, String content) {
        final TravelPlan travelPlan = planRepository.findById(planId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        final Comment comment = new Comment(content);
        commentRepository.save(comment);

        final TravelPlanComment planComment =
                new TravelPlanComment(writerId, travelPlan, comment);

        planCommentRepository.save(planComment);
    }

    @Transactional(readOnly = true)
    public List<CommentDto> getOrderedComments(Long planId) {
        return planCommentRepository
                .getOrderedCommentsByPlanId(planId)
                .stream()
                .map(CommentDto::of)
                .toList();
    }

    @Transactional
    public void deleteComment(String deleterId, Long planId, Long commentId) {

        TravelPlanComment planComment = planCommentRepository.findByPlanIdAndCommentId(planId, commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        planComment.comment().verifyWriter(deleterId);

        planCommentRepository.delete(planComment);
        commentRepository.delete(planComment.comment());
    }
}
