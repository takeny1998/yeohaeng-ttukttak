package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TravelRepository extends JpaRepository<Travel, Long> {

    @Query("SELECT DISTINCT t " +
            "FROM TravelCity as tc " +
            "JOIN tc.travel as t " +
            "WHERE tc.city.id = :cityId")
    List<Travel> findAllByCity(Long cityId);

    @Query("SELECT DISTINCT t FROM Travel t " +
            "JOIN TravelCompanion tc on tc.travel = t " +
            "JOIN TravelMotivation tm on tm.travel = t " +
            "AND tc.type = :companionType " +
            "AND tm.motivation in :motivations"
    )
    List<Travel> findByProperties(
            CompanionType companionType, List<Motivation> motivations);

}
