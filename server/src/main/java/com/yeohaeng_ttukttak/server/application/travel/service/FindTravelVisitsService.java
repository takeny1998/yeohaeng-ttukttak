package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FindTravelVisitsService {

    private final TravelRepository travelRepository;

    @Transactional(readOnly = true)
    public List<TravelVisitDto> call(Long travelId) {
        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundException(Travel.class));

        return travel.visits().stream()
                .map((TravelVisitDto::of))
                .toList();
    }

}
