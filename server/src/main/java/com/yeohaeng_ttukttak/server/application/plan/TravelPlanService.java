package com.yeohaeng_ttukttak.server.application.plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanCommentDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class TravelPlanService {

    private final TravelPlanRepository travelPlanRepository;

    @Transactional
    public void writeComment(Long planId, String writerId, String content) {
        final TravelPlan travelPlan = travelPlanRepository.findById(planId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        travelPlan.writeComment(writerId, content);
    }

    @Transactional(readOnly = true)
    public List<TravelPlanCommentDto> getOrderedComments(Long planId) {

        final TravelPlan travelPlan = travelPlanRepository.findById(planId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        return travelPlan
                .getOrderedComments()
                .stream()
                .map(TravelPlanCommentDto::of)
                .toList();
    }

}
