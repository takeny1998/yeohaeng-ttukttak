package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ForbiddenErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
@Slf4j
@RequiredArgsConstructor
public class UpdateTravelVisitService {

    private final MemberTravelRepository travelRepository;

    @Transactional
    public void call(UpdateTravelVisitCommand command) {

        MemberTravel travel = travelRepository.findById(command.travelId())
                .orElseThrow(() -> new EntityNotFoundException(Travel.class));

        if (!Objects.equals(travel.member().id(), command.memberId())) {
            throw new ForbiddenErrorException(TravelVisit.class);
        }

        boolean inRange = LocalDateUtil
                .isInRange(command.visitedOn(), travel.startedOn(), travel.endedOn());

        if (!inRange) {
            throw new ArgumentNotInRangeFailException("visitedOn", travel.startedOn(), travel.endedOn());
        }

        final long dayOfTravel = LocalDateUtil.getBetweenDays(travel.startedOn(), command.visitedOn());

        log.debug("command = {}", command);
        log.debug("dayOfTravel = {}", dayOfTravel);

        travel.moveVisit(
                command.visitId(),
                (int) dayOfTravel,
                command.orderOfVisit());
    }

}
