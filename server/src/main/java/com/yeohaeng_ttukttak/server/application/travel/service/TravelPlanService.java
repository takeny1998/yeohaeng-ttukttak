package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelCreatorRole;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelParticipantRole;
import jakarta.annotation.Nullable;
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
    public Long create(final Long travelId,
                       final Long placeId,
                       final Integer dayOfTravel,
                       final String memberId) {

        final Travel travel = travelRepository
                .findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(memberId)
                .or(new TravelCreatorRole(travel))
                .or(new TravelParticipantRole(travel))
                .authorize();

        final Place place = placeRepository
                .findById(placeId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return travel.addPlan(place, dayOfTravel);
    }

    @Transactional(readOnly = true)
    public TravelPlanDto findById(final Long planId) {
        final TravelPlan plan = travelPlanRepository.findById(planId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return TravelPlanDto.of(plan);
    }

    @Transactional(readOnly = true)
    public List<TravelPlanDto> findAllByTravelId(Long travelId) {
        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return travel.plans().stream()
                .map(TravelPlanDto::of)
                .toList();
    }

    @Transactional
    public void move(final Long travelId,
                     final Long planId,
                     @Nullable final Integer orderOfPlan,
                     @Nullable final LocalDate willVisitOn,
                     final String memberId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(memberId)
                .or(new TravelCreatorRole(travel))
                .or(new TravelParticipantRole(travel))
                .authorize();

        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travel.movePlan(travelPlan, orderOfPlan, willVisitOn);
    }

    @Transactional
    public void delete(Long travelId, Long planId, String memberId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(memberId)
                .or(new TravelCreatorRole(travel))
                .or(new TravelParticipantRole(travel))
                .authorize();

        final TravelPlan travelPlan = travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travel.deletePlan(travelPlan);

    }

}
