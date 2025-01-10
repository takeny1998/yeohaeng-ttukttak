package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;
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

    /**
     * 지정한 여행에 새로운 도시를 추가한다.
     * @param travelId 찾을 여행의 식별자
     * @param placeId 찾을 장소의 식별자
     * @param dayOfTravel 계획을 수행할 일자
     * @throws EntityNotFoundFailException 엔티티를 찾을 수 없는 경우 발생한다.
     */
    @Transactional
    public void create(Long travelId, Long placeId, Integer dayOfTravel) {

        final Travel travel = travelRepository
                .findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final Place place = placeRepository
                .findById(placeId)
                .orElseThrow(() -> new EntityNotFoundFailException(Place.class));

        travel.addPlan(place, dayOfTravel);

    }

    @Transactional(readOnly = true)
    public List<TravelPlanDto> findAll(Long travelId) {
        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return travel.plans().stream()
                .map((TravelPlanDto::of))
                .toList();
    }

    @Transactional
    public void move(Long travelId, Long planId, Integer orderOfPlan, LocalDate willVisitOn) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        travel.movePlan(travelPlan, orderOfPlan, willVisitOn);
    }

    @Transactional
    public void delete(Long travelId, Long planId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        travel.deletePlan(travelPlan);

    }

}
