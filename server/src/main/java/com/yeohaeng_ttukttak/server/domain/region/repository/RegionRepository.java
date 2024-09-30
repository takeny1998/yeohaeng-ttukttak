package com.yeohaeng_ttukttak.server.domain.region.repository;

import com.yeohaeng_ttukttak.server.domain.region.entity.City;
import com.yeohaeng_ttukttak.server.domain.region.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.region.entity.Region;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RegionRepository extends JpaRepository<Geography, Long> {

    @Query("SELECT r FROM Region r")
    List<Region> findAllRegion();

    @Query("SELECT c FROM City c")
    List<City> findAllCity();

    @Query("SELECT c FROM City c WHERE c.id IN :ids")
    List<City> findAllCityByIds(List<Long> ids);
}
