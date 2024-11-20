package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ForbiddenErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelVisitRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class UpdateTravelVisitService {

    private final MemberTravelRepository travelRepository;

    @Transactional
    public void call(Long travelId, String memberId, UpdateTravelVisitCommand command) {

        MemberTravel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundException(Travel.class));

        if (!Objects.equals(travel.member().id(), memberId)) {
            throw new ForbiddenErrorException(TravelVisit.class);
        }

        travel.moveVisit(
                command.id(),
                command.dayOfTravel(),
                command.orderOfVisit());
    }

}
