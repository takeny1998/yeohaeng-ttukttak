package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TravelVisitRepository extends JpaRepository<TravelVisit, Long> {

    @Query("SELECT v FROM TravelVisit AS v " +
            "WHERE v.travel = :travel " +
            "ORDER BY v.orderOfVisit")
    List<TravelVisit> findAllByTravel(Travel travel);

}
