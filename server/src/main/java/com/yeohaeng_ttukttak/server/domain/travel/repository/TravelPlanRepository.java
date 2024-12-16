package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TravelPlanRepository extends JpaRepository<TravelPlan, Long> {

    @Query("SELECT p FROM TravelPlan p " +
            "JOIN FETCH p.travel t " +
            "WHERE t.id = :travelId AND p.id = :planId")
    Optional<TravelPlan> findByIdAndTravelId(Long planId, Long travelId);

}
