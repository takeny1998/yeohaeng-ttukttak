package com.yeohaeng_ttukttak.server.application.travel_city;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCity;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TravelCityService {

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;

    @Transactional
    public void addCity(Long travelId, Long cityId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final City city = geographyRepository.findCityById(cityId)
                .orElseThrow(() -> new EntityNotFoundFailException(City.class));

        travel.addCity(city);
    }

    @Transactional(readOnly = true)
    public List<GeographyDto> findCities(Long travelId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return travel.cities().stream()
                .map(TravelCity::city)
                .map(GeographyDto::of)
                .toList();
    }

}
