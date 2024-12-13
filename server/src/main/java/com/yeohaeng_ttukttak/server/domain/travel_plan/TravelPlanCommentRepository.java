package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TravelPlanCommentRepository extends JpaRepository<TravelPlanComment, Long> {

    Optional<TravelPlanComment> findByPlanIdAndCommentId(Long planId, Long commentId);

    @Query("SELECT c FROM TravelPlanComment pc " +
            "JOIN pc.comment c " +
            "WHERE pc.plan.id = :planId " +
            "ORDER BY c.createdAt DESC, c.lastModifiedAt DESC, c.id ASC")
    List<Comment> getOrderedCommentsByPlanId(Long planId);

}
