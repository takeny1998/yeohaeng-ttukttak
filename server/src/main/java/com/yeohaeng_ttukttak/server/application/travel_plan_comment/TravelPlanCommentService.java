package com.yeohaeng_ttukttak.server.application.travel_plan_comment;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlanComment;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanCommentDto;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanCommentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelPlanCommentService {

    private final TravelPlanRepository travelPlanRepository;
    private final TravelPlanCommentRepository travelPlanCommentRepository;

    @Transactional
    public void write(final Long travelId, final Long planId, final String content) {

        final TravelPlan travelPlan = findTravelPlan(travelId, planId);

        travelPlanCommentRepository.save(
                new TravelPlanComment(travelPlan, content));

    }

    @Transactional(readOnly = true)
    public List<TravelPlanCommentDto> findAll(final Long travelId, final Long planId) {

        final TravelPlan travelPlan = findTravelPlan(travelId, planId);

        return travelPlan.getComments()
                .stream()
                .map(TravelPlanCommentDto::of)
                .toList();
    }

    @Transactional
    public void edit(final Long travelId, final Long planId, final Long commentId, final String content) {

        final TravelPlanComment travelPlanComment = travelPlanCommentRepository
                .findById(commentId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travelPlanComment.editContent(content);
    }

    @Transactional
    public void delete(final Long travelId, final Long planId, final Long commentId) {

        final TravelPlanComment travelPlanComment = travelPlanCommentRepository
                .findById(commentId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        travelPlanCommentRepository.delete(travelPlanComment);
    }

    private TravelPlan findTravelPlan(Long travelId, Long planId) {
        return travelPlanRepository
                .findByIdAndTravelId(planId, travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);
    }
}
