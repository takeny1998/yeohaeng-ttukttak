package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.comment.CommentWriterRole;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlan;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelPlanComment;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanCommentDto;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanCommentRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelCreatorRole;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelParticipantRole;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.ENTITY_NOT_FOUND_FAIL;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelPlanCommentService {

    private final TravelPlanRepository travelPlanRepository;
    private final TravelPlanCommentRepository travelPlanCommentRepository;

    @Transactional
    public void write(final Long planId, final String memberId, final String content) {

        final TravelPlan travelPlan = travelPlanRepository
                .findById(planId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(memberId)
                .or(new TravelCreatorRole(travelPlan.getTravel()))
                .or(new TravelParticipantRole(travelPlan.getTravel()))
                .authorize();

        travelPlanCommentRepository.save(
                new TravelPlanComment(travelPlan, content));

    }

    @Transactional(readOnly = true)
    public List<TravelPlanCommentDto> findAll(final Long planId) {

        final TravelPlan travelPlan = travelPlanRepository
                .findById(planId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        return travelPlan.getComments()
                .stream()
                .map(TravelPlanCommentDto::of)
                .toList();
    }

    @Transactional
    public void edit(final Long planId, final Long commentId, final String memberId, final String content) {

        final TravelPlanComment comment = travelPlanCommentRepository
                .findWithPlanId(planId, commentId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(memberId)
                .or(new CommentWriterRole(comment))
                .authorize();

        comment.editContent(content);
    }

    @Transactional
    public void delete(final Long planId, final Long commentId, final String memberId) {

        final TravelPlanComment comment = travelPlanCommentRepository
                .findWithPlanId(planId, commentId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(memberId)
                .or(new TravelCreatorRole(comment.getPlan().getTravel()))
                .or(new CommentWriterRole(comment))
                .authorize();

        travelPlanCommentRepository.delete(comment);
    }

}
