package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FindTravelVisitsService {

    private final TravelRepository travelRepository;

    public List<TravelVisitDto> call(Long id) {
        final Travel travel = travelRepository.findById(id)
                .orElseThrow(EntityNotFoundException::new);

        return travel.visits().stream()
                .map(TravelVisitDto::of)
                .toList();
    }

}
