package com.yeohaeng_ttukttak.server.domain.place.repository;

import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {

    @Query("SELECT p FROM Place p " +
            "JOIN p.categories pcm " +
            "WHERE pcm.place = p AND pcm.type = :category")
    List<Place> findByCategory(PlaceCategoryType category);
}
