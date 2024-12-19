package com.yeohaeng_ttukttak.server.domain.geography.repository;

import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Province;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface GeographyRepository extends JpaRepository<Geography, Long> {

    @Query("SELECT c FROM City c WHERE c.id IN :ids")
    List<City> findAllCityByIds(List<Long> ids);

    Optional<City> findCityById(Long id);
}
