package com.yeohaeng_ttukttak.server.domain.region.repository;

import com.yeohaeng_ttukttak.server.domain.region.entity.City;
import com.yeohaeng_ttukttak.server.domain.region.entity.Region;
import com.yeohaeng_ttukttak.server.domain.region.entity.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RegionRepository extends JpaRepository<Region, Long> {

    @Query("SELECT s FROM State s")
    List<State> findAllState();

    @Query("SELECT c FROM City c WHERE c.id IN :ids")
    List<City> findAllCityByIds(List<Long> ids);
}
