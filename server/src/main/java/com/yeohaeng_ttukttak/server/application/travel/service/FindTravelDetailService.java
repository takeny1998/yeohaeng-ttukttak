package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.FindTravelDetailResult;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelVisitRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FindTravelDetailService {

    private final TravelRepository travelRepository;
    private final TravelVisitRepository visitRepository;

    public FindTravelDetailResult call(Long id) {

        final Travel travel = travelRepository.findById(id)
                .orElseThrow(EntityNotFoundException::new);

        final List<TravelVisit> visits = visitRepository.findAllByTravel(travel);

        final List<Place> places = visits.stream()
                .map(TravelVisit::place)
                .distinct()
                .toList();

        return FindTravelDetailResult.of(visits, places);
    }

}
