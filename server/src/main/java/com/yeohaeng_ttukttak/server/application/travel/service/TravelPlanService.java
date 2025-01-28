package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlan;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TravelPlanService {

    private final TravelRepository travelRepository;

    private final TravelPlanRepository travelPlanRepository;

    private final PlaceRepository placeRepository;

    @Transactional
    public void create(Long travelId, Long placeId, Integer dayOfTravel) {

        final Travel travel = travelRepository
                .findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        final Place place = placeRepository
                .findById(placeId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travel.addPlan(place, dayOfTravel);

    }

    @Transactional(readOnly = true)
    public List<TravelPlanDto> findAll(Long travelId) {
        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return travel.plans().stream()
                .map((TravelPlanDto::of))
                .toList();
    }

    @Transactional
    public void move(Long travelId, Long planId, Integer orderOfPlan, LocalDate willVisitOn) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travel.movePlan(travelPlan, orderOfPlan, willVisitOn);
    }

    @Transactional
    public void delete(Long travelId, Long planId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travel.deletePlan(travelPlan);

    }

}
