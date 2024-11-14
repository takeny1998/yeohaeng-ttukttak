package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TravelRepository extends JpaRepository<Travel, Long> {

    @Query("SELECT DISTINCT t " +
            "FROM TravelCity as tc " +
            "JOIN tc.travel as t " +
            "WHERE tc.city.id = :cityId")
    List<Travel> findByCity(Long cityId);

}
