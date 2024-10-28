package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FindTravelsByCityService {

    private final TravelRepository travelRepository;

    public List<TravelDto> call(Long cityId) {
        final List<Travel> travels = travelRepository.findByCity(cityId);

        travels.forEach(Travel::motivations);
        travels.forEach(Travel::companions);

        return travels.stream()
                .map(TravelDto::of)
                .toList();
    }


}
