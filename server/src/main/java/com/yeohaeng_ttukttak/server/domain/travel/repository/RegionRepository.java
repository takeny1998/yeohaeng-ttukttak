package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.place.entity.City;
import com.yeohaeng_ttukttak.server.domain.place.entity.Region;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RegionRepository extends JpaRepository<Region, Long> {

    @Query("SELECT c FROM City c WHERE c.id IN :ids")
    List<City> findAllCityByIds(List<Long> ids);

}
