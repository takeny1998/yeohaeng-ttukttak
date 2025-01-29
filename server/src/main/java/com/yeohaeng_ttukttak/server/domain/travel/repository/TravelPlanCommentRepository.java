package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlanComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TravelPlanCommentRepository extends JpaRepository<TravelPlanComment, Long> {

    @Query("SELECT c FROM TravelPlanComment c " +
            "JOIN FETCH c.plan p " +
            "WHERE p.id = :planId AND c.id = :commentId")
    Optional<TravelPlanComment> findWithPlanId(Long planId, Long commentId);

}
