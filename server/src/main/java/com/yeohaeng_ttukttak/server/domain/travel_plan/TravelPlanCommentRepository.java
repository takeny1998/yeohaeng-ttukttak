package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TravelPlanCommentRepository extends JpaRepository<TravelPlanComment, Long> {

    @Query("SELECT pc FROM TravelPlanComment pc " +
            "JOIN FETCH pc.comment c " +
            "JOIN FETCH pc.plan p " +
            "JOIN FETCH p.travel t " +
            "WHERE t.id = :travelId AND p.id = :planId AND c.id = :commentId ")
    Optional<TravelPlanComment> findByTravelIdAndPlanIdAndCommentId(
            Long travelId, Long planId, Long commentId);

    Optional<TravelPlanComment> findByPlanIdAndCommentId(Long planId, Long commentId);

    @Query("SELECT c FROM TravelPlanComment pc " +
            "JOIN pc.comment c " +
            "WHERE pc.plan.id = :planId " +
            "ORDER BY c.createdAt DESC, c.lastModifiedAt DESC, c.id ASC")
    List<Comment> getOrderedCommentsByPlanId(Long planId);

}
