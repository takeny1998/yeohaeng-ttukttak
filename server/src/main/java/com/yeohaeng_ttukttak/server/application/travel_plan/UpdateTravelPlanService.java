package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
public class UpdateTravelPlanService {

    private final TravelRepository travelRepository;

    @Transactional
    public void call(UpdateTravelVisitCommand command) {

        final Travel travel = travelRepository.findById(command.travelId())
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        travel.verifyModifyGrant(command.memberId());

        boolean inRange = LocalDateUtil
                .isInRange(command.visitedOn(), travel.startedOn(), travel.endedOn());

        if (!inRange) {
            throw new ArgumentNotInRangeFailException("willVisitOn", travel.startedOn(), travel.endedOn());
        }

        final long dayOfTravel = LocalDateUtil.getBetweenDays(travel.startedOn(), command.visitedOn());

        log.debug("command = {}", command);
        log.debug("dayOfTravel = {}", dayOfTravel);

        travel.movePlan(
                command.visitId(),
                (int) dayOfTravel,
                command.orderOfVisit());
    }

}
