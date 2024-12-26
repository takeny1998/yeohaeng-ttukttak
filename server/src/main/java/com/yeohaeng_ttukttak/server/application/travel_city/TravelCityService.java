package com.yeohaeng_ttukttak.server.application.travel_city;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCity;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelName;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelNameService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Locale;

@Service
@RequiredArgsConstructor
public class TravelCityService {

    private final TravelNameService travelNameService;

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;

    @Transactional
    public void addCity(Locale locale, String memberId, Long travelId, Long cityId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final City city = geographyRepository.findCityById(cityId)
                .orElseThrow(() -> new EntityNotFoundFailException(City.class));

        travel.addCity(memberId, city);

        final List<City> newCities = travel.cities().stream()
                .map(TravelCity::city)
                .toList();

        final TravelName generatedDefaultName =
                travelNameService.generateDefaultName(locale, newCities);

        travel.rename(memberId, generatedDefaultName);
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
