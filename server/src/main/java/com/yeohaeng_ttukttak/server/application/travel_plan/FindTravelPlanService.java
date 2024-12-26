package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FindTravelPlanService {

    private final TravelRepository travelRepository;

    @Transactional(readOnly = true)
    public List<TravelPlanDto> findAll(Long travelId) {
        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return travel.plans().stream()
                .map((TravelPlanDto::of))
                .toList();
    }

}
