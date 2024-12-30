package com.yeohaeng_ttukttak.server.domain.travelogue.repository;

import com.yeohaeng_ttukttak.server.domain.travelogue.entity.Travelogue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TravelogueRepository extends JpaRepository<Travelogue, Long> {

    @Query("SELECT t FROM TravelogueCity tc JOIN tc.travelogue t WHERE tc.city.id = :cityId")
    List<Travelogue> findAllByCityId(Long cityId);

}
