package com.yeohaeng_ttukttak.server.application.plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import com.yeohaeng_ttukttak.server.domain.comment.CommentRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
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

    private final TravelRepository travelRepository;
    private final TravelPlanRepository travelPlanRepository;
    private final TravelPlanCommentRepository travelPlanCommentRepository;

    private final CommentRepository commentRepository;

    @Transactional
    public void writeComment(String writerId, Long travelId, Long planId, String content) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        travel.verifyModifyGrant(writerId);

        final TravelPlan travelPlan = travelPlanRepository.findById(planId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        final Comment comment = new Comment(content);
        commentRepository.save(comment);

        travelPlanCommentRepository.save(new TravelPlanComment(travelPlan, comment));
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
    public void deleteComment(String deleterId, Long planId, Long commentId) {

        TravelPlanComment planComment = travelPlanCommentRepository.findByPlanIdAndCommentId(planId, commentId)
                .orElseThrow(() -> new EntityNotFoundFailException(Comment.class));

        planComment.comment().verifyWriter(deleterId);

        travelPlanCommentRepository.delete(planComment);
        commentRepository.delete(planComment.comment());
    }
}
