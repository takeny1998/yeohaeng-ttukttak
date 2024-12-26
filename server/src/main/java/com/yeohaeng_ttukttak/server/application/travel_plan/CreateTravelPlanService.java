package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CreateTravelPlanService {

    private final TravelRepository travelRepository;
    private final PlaceRepository placeRepository;

    @Transactional
    public void createOne(Long travelId, String memberId, Long placeId, Integer dayOfTravel) {

        final Travel travel = travelRepository
                .findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final long totalDays = LocalDateUtil.getBetweenDays(travel.startedOn(), travel.endedOn());

        if (dayOfTravel < 0 || dayOfTravel >= totalDays) {
            throw new ArgumentNotInRangeFailException("dayOfTravel", 0, totalDays);
        }

        travel.verifyModifyGrant(memberId);

        final Place place = placeRepository
                .findById(placeId)
                .orElseThrow(() -> new EntityNotFoundFailException(Place.class));

        travel.addPlan(place, dayOfTravel);
    }

}
