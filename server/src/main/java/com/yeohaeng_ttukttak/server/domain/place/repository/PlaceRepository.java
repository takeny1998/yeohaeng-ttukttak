package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {


    @Query("SELECT p FROM Place p JOIN City c ON c.id = :cityId WHERE p.regionCode between c.codeStart AND c.codeEnd")
    List<Place> findAllByCityId(Long cityId);

}
